class Serving < ApplicationRecord
  belongs_to :school_meal
  belongs_to :food_supply
  has_many :preparing_user_meals, dependent: :destroy
  has_many :user_meals, through: :preparing_user_meals
end
