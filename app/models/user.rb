# frozen_string_literal: true

class User < ApplicationRecord
  # encrypt password
  has_secure_password

  has_many :user_tokens, dependent: :destroy
  has_many :tips, dependent: :destroy

  validates :name, :email, :password_digest, :birthday_date, presence: true

  validates :name, format: { with: /\A[a-zA-Z]+\z/ }, length: { minimum: 3 }
  validates :phone_number, allow_blank: true, length: { in: 9..13 }

  validates :email, confirmation: true, uniqueness: true
  validates :password_digest, confirmation: { case_sensitive: true }
end
