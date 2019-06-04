class Preference < ApplicationRecord
  has_many :join_table_profile_preferences, dependent: :destroy
  has_many :profiles, through: :join_table_profile_preferences
end
