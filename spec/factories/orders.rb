FactoryBot.define do
  factory :order do
    address { "New York, NY" }
    user
    toy
  end
end
