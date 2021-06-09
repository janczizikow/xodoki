# frozen_string_literal: true

FactoryBot.define do
  factory :hike do
    user
    category
    direction
    name { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
    date { Faker::Date }
    distance { Faker::Number.between(from: 1, to: 10) }
  end
end
