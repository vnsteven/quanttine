module StatisticsHelper
  def the_most_ordered_foods
    food_name = PreparingUserMeal.all.map { |i| i.serving.food_supply.name }
    food_count = food_name.map { |name| food_name.count(name) }
    hash_food_name_count = food_name.zip(food_count).to_h
    return hash_food_name_count.sort_by { |key, value| value}.last(10)
  end

  def number_of_orders_per_day
    school_meal_date = PreparingUserMeal.all.map { |preparation| preparation.serving.school_meal.date }
    number_of_servings = school_meal_date.map{|number| school_meal_date.count(number)}
    hash_school_meal_count = school_meal_date.zip(number_of_servings).to_h
  end

  def number_of_preferences
    list_of_preferences = JoinTableProfilePreference.all.map { |i| i.preference.name }
    categories_of_preferences = JoinTableProfilePreference.all.map { |i| i.preference.name }.uniq
    prefences_count =  categories_of_preferences.map { |category| list_of_preferences.count(category) }
    hash_of_preferences = categories_of_preferences.zip(prefences_count).to_h
  end

  def number_of_students 
    students = Profile.all.map { |profile| profile if current_admin.school == profile.school }
    return students.count
  end

  def stock_quantity
    food_supply = Quantity.all.map { |quantity| quantity if current_admin.school == quantity.school }
    return food_supply.count
  end

  def number_of_servings
    meals = SchoolMeal.all.map { |meal| meal }
    return meals.count
  end

  def is_tomorrow_menu_done?
    tomorrow_meal = SchoolMeal.find_by(date: Date.tomorrow)
    if tomorrow_meal == nil
      return "A faire"
    else
      return "Fait"
    end
  end
end