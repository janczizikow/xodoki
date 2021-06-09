# frozen_string_literal: true

FactoryBot.define do
  factory :photo do
    user
    hike
    text { Faker::Lorem.sentence }
    link { Faker::Internet.url }
  end
end
