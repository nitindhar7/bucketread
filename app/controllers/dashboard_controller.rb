class DashboardController < ApplicationController
  
  before_filter :auth_login, :only => [:index]
  
  def index
    @pages = Page.find( :all, :order => "updated_at", :conditions => { :user_id => current_user.id } )
  end

  def welcome
  end

  def pages
    @pages = Page.find( :all, :order => "updated_at", :conditions => { :user_id => current_user.id, :status => params[:status] } )
    
    respond_to do |format|
      format.js { render :partial => "pages" }
    end
  end
  
end