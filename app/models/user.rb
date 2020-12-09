# frozen_string_literal: true

class User < ApplicationRecord
  # encrypt password
  has_secure_password

  has_many %i[user_tokens tips], dependent: :destroy

  validates :name, :birthday_date, :email, :password_digest, presence: true

  validates :email, confirmation: true, uniqueness: true
  validates :password_digest, confirmation: { case_sensitive: true }
end
