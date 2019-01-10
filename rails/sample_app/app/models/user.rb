class User < ApplicationRecord
  attr_accessor :remember_token
  #downcase all email before save in database
  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, presence: true, length: { maximum: 50 }
  validates :password, presence:true
  validates :email, presence: true, length: { maximum: 150 },format: { with: VALID_EMAIL_REGEX },uniqueness: { case_sensitive: false }
  # encode the password
  has_secure_password

  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  #return random token
  def new_token
  	SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def authenticated? remember_token
  	BCrypt::Password.new(remember_digest).is_password? remember_token
  end

  def remember user
  	user.remember
  	cookies.permanent.signed[:user_id] = user.id
  	cookies.permanent[:remember_token] = user.remember_token
  end
end
