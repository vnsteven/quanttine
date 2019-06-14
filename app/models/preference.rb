class Preference < ApplicationRecord
  enum category: { diet: 0, allergy: 1}

  has_many :join_table_profile_preferences, dependent: :destroy
  has_many :profiles, through: :join_table_profile_preferences
  has_many :join_table_preference_foods, dependent: :destroy
  has_many :food_supplies, through: :join_table_preference_foods

  validates :name,
  presence: true,
  length: { in: 2..100 }


end
