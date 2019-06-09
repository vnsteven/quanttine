class FoodSupply < ApplicationRecord
  has_many :quantities, dependent: :destroy
  has_many :schools, through: :quantities
  has_many :servings, dependent: :destroy
  has_many :school_meals, through: :servings
  has_many :join_table_preference_foods, dependent: :destroy
  has_many :preferences, through: :join_table_preference_foods

  validates :name,
  presence: true,
	length: { in: 2..100 },
	format: { with: /\A[a-zA-Z]+\z/,
		message: "Uniquement des lettres aucun autre charactère n'est accepté." }


end
