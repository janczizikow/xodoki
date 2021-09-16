# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    username { Faker::Name.name }
    email { Faker::Internet.unique.email }
    password { Faker::Internet.password }

    trait :admin do
      admin { true }
    end
  end
end
