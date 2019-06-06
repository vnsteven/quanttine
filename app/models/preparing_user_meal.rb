class PreparingUserMeal < ApplicationRecord
  belongs_to :user_meal
  belongs_to :serving
end
