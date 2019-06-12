class SchoolMeal < ApplicationRecord
  belongs_to :school
  has_many :servings, dependent: :destroy
  has_many :food_supplies, through: :servings
  after_create :attach_daily_service
  validate :check_meal_date

  private

  def check_meal_date
    if self.date < DateTime.now
      errors.add(:date, message: "la date de création d'un repas ne peut pas être dans le passé")
    elsif self.date > DateTime.now.next_year.to_time
      errors.add(:date, message: "impossible de créer un repas plus d'un an à l'avance")
    end
  end

  def attach_daily_service
      DailyService.create(
        date: Date.today.strftime("%d/%m/%Y"),
        school_id: self.school_id
      )
  end

end
