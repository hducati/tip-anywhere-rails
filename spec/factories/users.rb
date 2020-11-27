FactoryBot.define do
  factory :user do
    name { Faker::StarWars.character}
    birthday_date { Faker::Date.birthday(min_age: 18, max_age: 60)}
    email { Faker::Internet.unique.email}
    password {Faker::Name.name }
  end
end