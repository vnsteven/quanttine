FactoryBot.define do
  factory :food_supply do
    name { Faker::Food.fruits }
  end
end
