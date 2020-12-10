class Tip < ApplicationRecord
  belongs_to :user

  validates :odd, :tip, :game, :unit, :user_id, presence: true

  validates :odd, :unit, numericality: { greater_than_or_equal_to: 0.01 }
end
