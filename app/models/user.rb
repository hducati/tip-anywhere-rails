# frozen_string_literal: true

class User < ApplicationRecord
  # encrypt password
  has_secure_password

  has_many :user_tokens, dependent: :destroy
  has_many :tips, dependent: :destroy

  validates :name, :birthday_date, :email, :password_digest, presence: true

  validates :email, confirmation: true, uniqueness: true
  validates :password_digest, confirmation: { case_sensitive: true }
end
