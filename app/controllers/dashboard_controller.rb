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
  
  def features
    redirect_to :back, :notice => "List of features coming soon!"
  end
  
  def faqs
    @faqs = Faq.find( :all )
  end
  
end