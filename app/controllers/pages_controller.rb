class PagesController < ApplicationController
  
  before_filter :auth_login
  
  def index
    @pages = Page.find( :all, :conditions => { :user_id => session[:user_id] } )
    
    respond_to do |format|
      format.xml { render :xml => @pages }
    end
  end
  
  def create
    @page = Page.new
    @page.url = params[:url].strip
    @page.user_id = params[:user_id]
    
    if @page.save
      redirect_to dashboard_path, :notice => "Added Page!"
    else
      redirect_to dashboard_path, :notice => "Page not added!"
    end
  end
  
  def read
    @page = Page.find( params[:id] )
    @page.status = 1
    
    if @page.save
      redirect_to dashboard_path, :notice => "Page marked as read!"
    else
      redirect_to dashboard_path, :notice => "Could not mark page as read!"
    end
  end
  
  def unread
    @page = Page.find( params[:id] )
    @page.status = 0
    
    if @page.save
      redirect_to dashboard_path, :notice => "Page marked as unread!"
    else
      redirect_to dashboard_path, :notice => "Could not mark page as unread!"
    end
  end
  
  def destroy
    Page.delete( params[:id] )
    
    respond_to do |format|
      format.html { redirect_to dashboard_path, :notice => "Page deleted!" }
    end
  end
  
  def tweet
    @page = Page.find( params[:id] )
    session[:twitter_client].update( "I found this interesting: #{@page.url} @BucketRead" )
    redirect_to dashboard_path, :notice => "Tweeted Link!"
  end
  
end
