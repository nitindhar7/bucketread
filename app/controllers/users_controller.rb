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
  
  def login
  end
  
  def authorize
    @user = User.authenticate( params[:email], params[:password] )
    if @user
      session[:user_id] = @user.id
      flash[:notice] = "Logged in!"
      redirect_to dashboard_path
    else
      flash[:error] = "Invalid Email or Password"
      redirect_to login_path
    end
  end
  
  def logout
    session[:user_id] = nil
    redirect_to login_path, :notice => "Logged Out!"
  end
  
end
