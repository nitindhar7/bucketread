class ApplicationController < ActionController::Base
  
  helper :all
  helper_method :current_user, :auth_login
  protect_from_forgery
  
  private
  
  def current_user
    @current_user ||= User.find( session[:user_id] ) if session[:user_id]
  end
  
  def auth_login
    reset_session if session[:last_seen] < 1.days.ago
    
    unless current_user
      redirect_to login_path, :notice => "Please Login or Signup"
    end
  end
  
  def reset_session
    session[:user_id] = nil
    session[:auth] = nil
    session[:twitter_client] = nil
  end
  
end
