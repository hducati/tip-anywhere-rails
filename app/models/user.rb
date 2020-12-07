# frozen_string_literal: true

class User < ApplicationRecord
  # encrypt password
  has_secure_password

  has_many :user_tokens, dependent: :destroy

  validates :name, :birthday_date, :password_digest, presence: true

  validates :email, confirmation: true, uniqueness: true
end
