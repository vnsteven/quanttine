class DailyService < ApplicationRecord
  belongs_to :school
  serialize :queue, Array

end
