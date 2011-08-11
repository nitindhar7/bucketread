class PhotosController < ApplicationController
  
  before_filter :auth_login, :only => [:index]

  def nav_thumbnail
    @photo = Photo.find( params[:id] )
    send_data ( @photo.binary_data, :type => @photo.content_type, :filename => @photo.filename, :disposition => 'inline' )
  end
  
end