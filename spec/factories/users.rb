FactoryBot.define do
  factory :user do
    name { Faker::Name.unique.name}
    birthday_date { Faker::Date.birthday(min_age: 18, max_age: 60)}
    email { Faker::Internet.unique.email}
    password_digest {Faker::Name.unique.name }
  end
end