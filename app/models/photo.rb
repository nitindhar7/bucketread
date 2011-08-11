class Photo < ActiveRecord::Base
  
  # ASSOCIATIONS
  belongs_to :user
  
  # METHODS
  def user_photo=(input_data)
    self.filename = input_data.original_filename
    self.content_type = input_data.content_type.chomp
    self.binary_data = input_data.read
  end
  
end
