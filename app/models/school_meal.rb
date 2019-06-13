class SchoolMeal < ApplicationRecord
  belongs_to :school
  has_many :servings, dependent: :destroy
  has_many :food_supplies, through: :servings
  validate :check_meal_date
  after_create :attach_daily_service

  private

  def check_meal_date
    if self.date < Date.today
      errors.add(:date, message: "un repas ne peut pas être créé dans le passé")
    end
  end

  def attach_daily_service
      DailyService.create(
        date: Date.today.strftime("%d/%m/%Y"),
        school_id: self.school_id
      )
  end

end
