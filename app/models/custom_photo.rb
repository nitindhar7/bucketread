class CustomPhoto
  
  attr_accessor :original_filename, :content_type, :data
  
  def initialize(original_filename, content_type, data)
    @original_filename = original_filename
    @content_type = content_type
    @data = data
  end
  
  def read
    @data
  end
  
end