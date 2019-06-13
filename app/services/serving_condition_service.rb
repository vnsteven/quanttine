class ServingConditionService
  def initialize(meal_category, school_meal, food_supply)
    @meal_category = meal_category
    @school_meal = school_meal
    @food_supply = food_supply
  end

  def perform
    create_food_serving_condition
  end

  private

  def create_food_serving_condition
    create_food_serving if Serving.find_by(school_meal_id: @school_meal.id, food_supply_id: @food_supply.id) == nil && Serving.where(school_meal_id: @school_meal.id, meal_category: @meal_category).map { |i| i }.count < 4
  end

  def create_food_serving
    @food_serving = Serving.create!(meal_category: @meal_category, school_meal_id: @school_meal.id, food_supply_id: @food_supply.id)
  end

end