class School < ApplicationRecord
  has_many :admins, dependent: :destroy
  has_many :profiles, dependent: :destroy # actually, we won't destroy any profiles or schools. We'll just deactive both of these entries in their respective tables
  has_many :quantities, dependent: :destroy
  has_many :food_supplies, through: :quantities
  has_many :school_meals, dependent: :destroy

  validates :name,
  presence: true,
  length: { in: 2..100 }

  validates :city,
  presence: true,
  length: { in: 2..50 },
  format: { with: /\A[a-zA-Z]+\z/,
		message: "Uniquement des lettres" }

  validates :street_address,
  presence: true,
  length: { in: 2..50 }

  validates :billing_address,
  length: { in: 2..50 }

  validates :zipcode,
  length: { in: 2..50 }
  
end
