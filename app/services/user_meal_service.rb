class UserMealService
  def initialize(school_meal)
    @school_meal = school_meal
  end

  def starters
    @starters = @school_meal.servings.where(meal_category: "entrée")
  end

  def main_courses
    @main_courses = @school_meal.servings.where(meal_category: "plat")
  end

  def desserts
    @desserts = @school_meal.servings.where(meal_category: "dessert")
  end

  def sides
    @sides = @school_meal.servings.where(meal_category: "accompagnement")
  end
end