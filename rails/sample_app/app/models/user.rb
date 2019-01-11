class User < ApplicationRecord
  attr_accessor :remember_token
  #downcase all email before save in database
  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, presence: true, length: { maximum: 50 }
  validates :password, presence: true, length: { minimum: 8 }, allow_nil: true
  validates :email, presence: true, length: { maximum: 150 },format: { with: VALID_EMAIL_REGEX },uniqueness: { case_sensitive: false }
  # encode the password
  has_secure_password
  
  # Returns hash digest of the string.
  def digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
 
  #return random token
  def new_token
  	SecureRandom.urlsafe_base64
  end

  #Save the encode token in database
  def remember
    self.remember_token = new_token
    update_attribute(:remember_digest, digest(remember_token))
  end

  #Check the remember_digest in database with cookies in browser
  def authenticated? remember_token
  	if remember_digest.nil?
      false
    else
      BCrypt::Password.new(remember_digest).is_password?(remember_token)
    end
  end
  
  #Delete remember_digest in database
  def forget
    update_attribute(:remember_digest, nil)
  end
end
