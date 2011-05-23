class Page < ActiveRecord::Base
  
  # ASSOCIATIONS
  belongs_to :user
  
  # VALIDATIONS
  validates_presence_of :url, :user_id
  validates_length_of :url, :in => 1..200
  
  # METHODS
  def status_in_words
    case self.status
      when 0
        "Unlocked"
      when 1
        "Locked"
    end
  end
  
end
