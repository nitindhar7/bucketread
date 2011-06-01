class PagesController < ApplicationController
  
  before_filter :auth_login
  
  def create
    @page = Page.new
    @page.url = params[:url]
    @page.user_id = params[:user_id]
    
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
      redirect_to dashboard_path, :notice => "Unlocked Page!"
    else
      redirect_to dashboard_path, :notice => "Could Not Unlock Page!"
    end
  end
  
  def destroy
    Page.delete( params[:id] )
    
    respond_to do |format|
      format.html { redirect_to dashboard_path, :notice => "Page deleted!" }
    end
  end
  
end
