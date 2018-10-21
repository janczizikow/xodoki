FactoryBot.define do
  factory :hike do
    user { nil }
    name { "MyString" }
    description { "MyText" }
    slug { "MyString" }
    date { "2018-10-20" }
    distance { 1 }
  end
end
