class FoodSupply < ApplicationRecord
  has_many :quantities, dependent: :destroy
  has_many :schools, through: :quantities
end
