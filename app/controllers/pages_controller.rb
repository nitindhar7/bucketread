class PagesController < ApplicationController
  
  before_filter :auth_login
  
  def new
    @page = Page.new
  end
  
  def create
    @page = Page.new( params[:page] )
    if @page.save
      redirect_to dashboard_path, :notice => "Added Page!"
    else
      render "new"
    end
  end
  
  def finish
    @page = Page.find( params[:id] )
    @page.status = 1
    
    if @page.save
      redirect_to dashboard_path, :notice => "Finished Page!"
    else
      redirect_to dashboard_path, :notice => "Could Not Finish Page!"
    end
  end
  
  def again
    @page = Page.find( params[:id] )
    @page.status = 0
    
    if @page.save
      redirect_to dashboard_path, :notice => "Finished Page!"
    else
      redirect_to dashboard_path, :notice => "Could Not Finish Page!"
    end
  end
  
end
