# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    birthday_date { Faker::Date.birthday(min_age: 18, max_age: 60) }
    email { 'foo@bar.com' }
    password { 'foobar' }
  end
end
