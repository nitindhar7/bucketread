class Page < ActiveRecord::Base
  
  # ASSOCIATIONS
  belongs_to :user
  
  # VALIDATIONS
  validates_presence_of :url, :user_id
  validates_length_of :url, :in => 1..200
  
  # METHODS  
  def formatted_url
    if url.length > 120
      "#{self.url[0..120]}..."
    else
      self.url
    end
  end
  
  def status_in_words
    if status == 0
      'unfinished'
    else
      'finished'
    end
  end
  
end
