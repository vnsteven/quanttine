module ServingsHelper
  def food_supply_list
    FoodSupply.all.map { |food| food.name }.uniq.sort
  end

  def serving_list
    Serving.all.map { |serving| serving.meal_category }.uniq
  end

  def no_menu_tomorrow
    SchoolMeal.find_by(date: Date.tomorrow).nil?
  end

  def servings_count_per_category(meal_category)
    tomorrow_school_meal = SchoolMeal.find_by(date: Date.tomorrow, school_id: current_admin.school.id)
    if tomorrow_school_meal != nil
      per_category = tomorrow_school_meal.servings.map { |serving| serving if serving.meal_category == meal_category }.compact
      return per_category.count
    end
  end
end
