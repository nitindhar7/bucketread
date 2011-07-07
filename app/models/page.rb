class Page < ActiveRecord::Base
  
  # ASSOCIATIONS
  belongs_to :user
  
  # VALIDATIONS
  validates_presence_of :url, :user_id
  validates_length_of :url, :in => 1..200
  
  # METHODS  
  def formatted_url
    url[0..90]
  end
  
  def status_in_words
    if status == 0
      'unread'
    else
      'read'
    end
  end
  
  def standardized_url
    url.match(/^[h][t][t][p][:][\/][\/]/) ? url : "http://#{url}"
  end
  
end
