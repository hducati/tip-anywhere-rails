# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { Faker::Name.first_name }
    birthday_date { Faker::Date.birthday(min_age: 18, max_age: 60) }
    email { 'foo@bar.com' }
    password { 'foobar' }
    phone_number { '5519971242942' }
  end
end
