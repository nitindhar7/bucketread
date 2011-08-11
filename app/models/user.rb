class User < ActiveRecord::Base
  
  # ASSOCIATIONS
  has_many :pages, :dependent => :delete_all
  has_many :providers, :dependent => :delete_all
  has_one :photo, :dependent => :delete
  
  # FILTERS
  before_save :encrypt_password
  
  # ACCESS MODIFIERS
  attr_readonly :password_salt, :password_hash
  attr_accessor :password
  attr_accessor :user_photo
  
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
    user = find( :first, :conditions => ['email = ?', email] )
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
  
  def add_photo(input_data)
    @photo = Photo.new
    @photo.user_photo = input_data
    @photo.user_id = self.id
    @photo.save!
  end
  
  def self.hashify_password(password, password_salt)
    BCrypt::Engine.hash_secret( password, password_salt )
  end
end
