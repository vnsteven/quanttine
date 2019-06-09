class SchoolMeal < ApplicationRecord
  belongs_to :school
  has_many :servings, dependent: :destroy
  has_many :food_supplies, through: :servings

  validate :check_meal_date

  private

  def check_meal_date
    if self.date < DateTime.now
      errors.add(:date, message: "la date de création d'un repas ne peut pas être dans le passé")
    end
  end

end
