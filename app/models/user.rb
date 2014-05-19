# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  password_digest :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base

  before_save { self.email = email.downcase }

  # Mandatory columns
  validates :name, presence: true
  validates :email, presence: true

  # Business rule (name length)
  validates :name, length: { maximum: 80 }

  # Business rule (email address validity)
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, format: { with: VALID_EMAIL_REGEX }

  # Business rule (email address should be unique)
  validates :email, uniqueness: { case_sensitive: false }

  # Business rule (password has to be present, verified, and authenticated)
  has_secure_password

  # Business rule (password length)
  validates :password, length: { minimum: 6 }

end
