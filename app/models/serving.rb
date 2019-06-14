class Serving < ApplicationRecord

  enum meal_category: { Entrée: 1, Plat: 2, Accompagnement: 3, Dessert: 4}

  belongs_to :school_meal
  belongs_to :food_supply
  has_many :preparing_user_meals, dependent: :destroy
  has_many :user_meals, through: :preparing_user_meals

end
