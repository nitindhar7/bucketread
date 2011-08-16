class Photo < ActiveRecord::Base
  
  # ASSOCIATIONS
  belongs_to :user
  
  # METHODS
  def user_photo=(input_data)
    self.filename = input_data.original_filename
    self.content_type = input_data.content_type.chomp
    self.binary_data = input_data.read
  end
  
  def self.default_thumbnail
    "#{Rails.root}/public/images/blank.png"
  end
  
  def self.default_thumbnail_filename
    self.default_thumbnail.split( "/" ).last
  end
  
  def self.default_content_type
    "image/png"
  end
  
end
