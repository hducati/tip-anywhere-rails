# frozen_string_literal: true

class User < ApplicationRecord
  # encrypt password
  has_secure_password

  has_many :user_tokens, dependent: :destroy
  has_many :tips, dependent: :destroy

  validates :name, format: { with: /\A[a-zA-Z]+\z/ }, length: { minimum: 3 }
  validates :password_digest, confirmation: { case_sensitive: true }

  validates :name, :email, :password_digest, :birthday_date, presence: true

  validates :email, confirmation: true, uniqueness: true
end
