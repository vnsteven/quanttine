class School < ApplicationRecord
  has_many :admin, dependent: :destroy
  has_many :profiles, dependent: :nullify
end
