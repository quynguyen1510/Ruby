class User < ApplicationRecord
  #downcase all email before save in database
  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 150 },format: { with: VALID_EMAIL_REGEX },uniqueness: { case_sensitive: false }
  # encode the password
  has_secure_password
end
