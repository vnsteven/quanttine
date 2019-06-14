class UserMeal < ApplicationRecord
  belongs_to :profile
  has_many :preparing_user_meals, dependent: :destroy
  has_many :servings, through: :preparing_user_meals

end
