class School < ApplicationRecord
  has_many :admins, dependent: :destroy
  has_many :profiles, dependent: :destroy # actually, we won't destroy any profiles or schools. We'll just deactive both of these entries in their respective tables
  has_many :quantities, dependent: :destroy
  has_many :food_supplies, through: :quantities
  has_many :school_meals, dependent: :destroy
  has_many :daily_services, dependent: :destroy

  validates :name,
  presence: true,
  length: { in: 2..100 }

  validates :city,
  presence: true,
  length: { in: 2..50 },
	format: { without: /[!@#%*+;,?&()=0123456789]/}

  validates :street_address,
  presence: true,
  length: { in: 2..100 }

  validates :zipcode,
  presence: true,
  length: { in: 2..50 }

end
