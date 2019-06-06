class JoinTablePreferenceFood < ApplicationRecord
  belongs_to :preference
  belongs_to :food_supply
end
