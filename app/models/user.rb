class User < ActiveRecord::Base
  
  # ASSOCIATIONS
  has_many :pages
  
  # FILTERS
  before_save :encrypt_password
  
  # ACCESS MODIFIERS
  attr_readonly :password_salt, :password_hash
  attr_accessor :password
  
  # VALIDATIONS
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :first_name, :last_name, :email
  validates_uniqueness_of :email
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates_length_of :first_name, :last_name, :in => 1..50
  validates_length_of :email, :in => 1..100
  
  # METHODS
  def self.authenticate(email, password)
    user = find_by_email( email )
    if user && user.password_hash == User.hashify_password( password, user.password_salt )
      user
    else
      nil
    end
  end
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = User.hashify_password( password, password_salt )
    end
  end
  
  def full_name
    "#{first_name} #{last_name}"
  end
  
  def self.hashify_password(password, password_salt)
    BCrypt::Engine.hash_secret( password, password_salt )
  end
end
