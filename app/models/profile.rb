class Profile < ApplicationRecord
  belongs_to :user, dependent: :destroy
end
