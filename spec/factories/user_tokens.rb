# frozen_string_literal: true

FactoryBot.define do
  factory :user_token do
    token { Faker::String.random }
    user_id { nil }
  end
end
