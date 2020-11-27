class User < ApplicationRecord
  has_many :user_tokens, dependent: :destroy

  validates_presence_of :name, :birthday_date, :email, :password
end
