# frozen_string_literal: true

class UserToken < ApplicationRecord
  belongs_to :user

  validates :token, presence: true
end
