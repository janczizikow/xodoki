# frozen_string_literal: true

FactoryBot.define do
  factory :hike do
    user { nil }
    name { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
    date { Faker::Date }
    distance { Faker::Number.between(1, 10) }
  end
end
