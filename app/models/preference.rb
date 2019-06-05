class Preference < ApplicationRecord
  enum category: { diet: 0, allergy: 1}

  has_many :join_table_profile_preferences, dependent: :destroy
  has_many :profiles, through: :join_table_profile_preferences
end
