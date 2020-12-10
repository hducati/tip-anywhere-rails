# frozen_string_literal: true

FactoryBot.define do
  factory :tip do
    odd { Faker::Number.decimal(l_digits: 2) }
    sport { 'Futebol' }
    tip { 'Brasil x Argentina - Escanteios' }
    unit { Faker::Number.decimal(l_digits: 2) }
    league { 'Brasileirão' }
    game { 'Brasil x Argentina' }
    description { 'Fiquem espertos aos 9 minutos do primeiro tempo' }
    status { nil }
    scheduled_at { nil }
    closed { nil }
    user_id { nil }
  end
end
