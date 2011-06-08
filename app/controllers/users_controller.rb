class UsersController < ApplicationController
  
  before_filter :auth_login, :only => [:logout]
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new( params[:user] )
    
    if @user.save
      session[:user_id] = @user.id
      redirect_to dashboard_path, :notice => "Signed Up!"
    else
      redirect_to root_path, :notice => "Sign Up Failed!"
    end
  end
  
  def authorize
    @user = User.authenticate( params[:email], params[:password] )
    
    respond_to do |format|
      if @user
        session[:user_id] = @user.id
        flash[:notice] = "Logged In!"
        format.html { redirect_to dashboard_path }
        format.json do
          @pages = Page.find( :all, :order => "updated_at", :conditions => { :user_id => current_user.id } )
          render :json => @pages
        end
      else
        flash[:notice] = "Invalid Email or Password"
        format.html { redirect_to root_path }
        format.json { render :json => nil }
      end
    end
  end
  
  def logout
    session[:user_id] = nil
    session[:auth] = nil
    session[:twitter_client] = nil
    redirect_to root_path, :notice => "Logged Out!"
  end
  
  def update
    @user = User.find( params[:id] )
    if @user.update_attributes( params[:user] )
      redirect_to dashboard_path, :notice => "Account Updated!"
    else
      redirect_to dashboard_path, :notice => "Account was not updated!"
    end
  end
  
  def login_with_twitter
    auth = request.env["omniauth.auth"]
    provider = Provider.find_by_name_and_uid( auth["provider"], auth["uid"] )
    
    if provider
      @user = User.find( provider.user_id )
    else
      @user = User.new
      @user.first_name = auth['user_info']['name'].split( ' ' ).first
      @user.last_name = auth['user_info']['name'].split( ' ' ).last
      @user.email = "#{auth['user_info']['nickname']}@bucketread.com"
      @user.password = (0...8).map{65.+(rand(25)).chr}.join
      @user.password_confirmation = @user.password
      @user.save
      
      Provider.create( :name => auth['provider'], :uid => auth['uid'], :user_id => @user.id )
      
      config_twitter( auth['credentials'] ).update( "I just signed up for @BucketRead ... Get your free account today http://bucketread.basedataapp.com!" )
    end
    
    if @user
      session[:user_id] = @user.id
      session[:auth] = auth
      flash[:notice] = "Logged In!"
      redirect_to dashboard_path
    else
      flash[:notice] = "Invalid Email or Password"
      redirect_to root_path
    end
  end
  
  private

  def config_twitter(credentials)
    Twitter.configure do |config|
      config.consumer_key = '509Q6f4idqCSlE4diJNw'
      config.consumer_secret = 'K3iKXvhiZqt2V0BsYcXbjTuPEe5KflWWvcVIiVHUPgw'
      config.oauth_token = credentials['token']
      config.oauth_token_secret = credentials['secret']
    end
    
    session[:twitter_client] = Twitter::Client.new
  end
  
end
