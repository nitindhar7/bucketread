class Page < ActiveRecord::Base
  
  # ASSOCIATIONS
  belongs_to :user
  
  # VALIDATIONS
  validates_presence_of :url, :user_id
  validates_length_of :url, :in => 1..200
  
  # METHODS  
  def formatted_url
    if url.length > 65
      "#{self.url[0..65]}..."
    else
      self.url
    end
  end
  
end
