class DashboardController < ApplicationController
  
  before_filter :auth_login, :only => [:index]
  
  def index
    @pages = Page.find( :all, :order => "updated_at", :conditions => { :user_id => current_user.id } )
    @filter_options = [['Filter'], ['All', 2], ['Read', 1], ['Unread', 0]]
    @action_options = [['Actions'], ['Mark as Read', 1], ['Mark as Unread', 0]]
    @disabled_filter_options = "Filter"
    @disabled_action_options = "Actions"
  end

  def welcome
  end

  def pages
    if params[:status] == '2'
      @pages = Page.find( :all, :order => "updated_at", :conditions => { :user_id => current_user.id } )
    else
      @pages = Page.find( :all, :order => "updated_at", :conditions => { :user_id => current_user.id, :status => params[:status] } )
    end
    
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