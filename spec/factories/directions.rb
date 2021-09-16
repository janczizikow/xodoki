# frozen_string_literal: true

FactoryBot.define do
  factory :direction do
    name { Faker::Lorem.unique.sentence }
  end
end
