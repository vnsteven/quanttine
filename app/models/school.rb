class School < ApplicationRecord
  has_many :admins, dependent: :destroy
  has_many :profiles, dependent: :nullify
end
