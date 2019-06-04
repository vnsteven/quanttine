class School < ApplicationRecord
  has_many :admin, dependent: :destroy
  has_many :users
end
