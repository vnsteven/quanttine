class SchoolMealService
  def initialize(date, admin_school_id)
    @date = date
    @admin_school_id = admin_school_id
  end

  def perform
    school_meal_exist?
  end

  private

  def school_meal_exist?
    if SchoolMeal.find_by(date: @date, school_id: @admin_school_id) == nil
      SchoolMeal.create!(date: @date, school_id: @admin_school_id)
    else
      SchoolMeal.find_by(date: @date, school_id: @admin_school_id)
    end

  end
end