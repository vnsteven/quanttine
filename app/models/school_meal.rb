class SchoolMeal < ApplicationRecord
  belongs_to :school
  has_many :servings, dependent: :destroy
  has_many :food_supplies, through: :servings
end
