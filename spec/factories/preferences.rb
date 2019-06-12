FactoryBot.define do
  factory :preference do
    name { Faker::Hipster.words }
    category { "diet" }
  end
end
