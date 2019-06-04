class Profile < ApplicationRecord
belongs_to :user
belongs_to :school
has_many :join_table_profile_preferences, dependent: :destroy
has_many :preferences, through: :join_table_profile_preferences
end
