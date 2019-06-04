class School < ApplicationRecord
  has_many :admins, dependent: :destroy
  has_many :profiles, dependent: :destroy # actually, we won't destroy any profiles or schools. We'll just deactive both of these entries in their respective tables
end
