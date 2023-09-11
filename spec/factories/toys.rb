require 'faker'

FactoryBot.define do
  factory :toy do
    name { Faker::Commerce.product_name }
    description { Faker::Lorem.sentence }
    price { Faker::Number.between(from: 20, to: 100) }
    user
  end
end
