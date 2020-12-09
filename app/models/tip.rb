class Tip < ApplicationRecord
  belongs_to :user

  validates :odd, :tip, :game, :unit, :user_id
end
