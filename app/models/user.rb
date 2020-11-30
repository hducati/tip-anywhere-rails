class User < ApplicationRecord
  # encrypt password
  has_secure_password

  has_many :user_tokens, dependent: :destroy

  validates_presence_of :name, :birthday_date, :email, :password_digest
end
