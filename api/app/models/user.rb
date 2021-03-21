require 'bcrypt'

class User < ApplicationRecord
  include BCrypt
  before_save :encrypt_password

  validates :email, uniqueness: true, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP } 
  validates :password, presence: true

  def encrypt_password
    self.password = Password.create(self.password)
  end

  def validate_password(password_sent)
    Password.new(self.password) == password_sent
  end
end
