class DashboardController < ApplicationController
  
  before_filter :auth_login, :only => [:index]
  
  def index
    @unlocked_pages = Page.find( :all, :order => "updated_at", :conditions => { :status => 0, :user_id => current_user.id } )
    @locked_pages = Page.find( :all, :order => "updated_at", :conditions => { :status => 1, :user_id => current_user.id } )
  end

  def welcome
  end
  
end
