class FoodSupply < ApplicationRecord
  has_many :quantities, dependent: :destroy
  has_many :schools, through: :quantities
  has_many :servings, dependent: :destroy
  has_many :school_meals, through: :servings
end
