FactoryBot.define do
  factory :serving do
    meal_category { "entrée" }
    school_meal { FactoryBot.create(:school_meal) }
    food_supply { FactoryBot.create(:food_supply) }
  end
end
