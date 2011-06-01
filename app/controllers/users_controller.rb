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
      render "new"
    end
  end
  
  def authorize
    @user = User.authenticate( params[:email], params[:password] )
    
    respond_to do |format|
      if @user
        session[:user_id] = @user.id
        flash[:notice] = "Logged in!"
        format.html { redirect_to dashboard_path }
        format.json do
          @pages = Page.find( :all, :order => "updated_at", :conditions => { :user_id => current_user.id } )
          render :json => @pages
        end
      else
        flash[:error] = "Invalid Email or Password"
        format.html { redirect_to root_path }
        format.json { render :json => nil }
      end
    end
  end
  
  def logout
    session[:user_id] = nil
    redirect_to root_path, :notice => "Logged Out!"
  end
end
