# frozen_string_literal: true

FactoryBot.define do
  factory :hike do
    user { nil }
    title { 'MyString' }
    description { 'MyText' }
    type { '' }
    date { '2018-10-15' }
  end
end
