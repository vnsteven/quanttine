class JoinTableProfilePreference < ApplicationRecord
  belongs_to :profile
  belongs_to :preference
end
