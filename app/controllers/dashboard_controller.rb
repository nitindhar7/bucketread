class DashboardController < ApplicationController
  
  before_filter :auth_login, :only => [:index]
  
  def index
    @pages = Page.find( :all, :order => "updated_at", :conditions => { :user_id => current_user.id } )
  end

  def welcome
  end
  
end