module StatisticsHelper
  def the_most_ordered_foods
    food_name = PreparingUserMeal.all.map { |i| i.serving.food_supply.name if i.serving.school_meal.school == current_admin.school }.compact
    food_count = food_name.map { |name| food_name.count(name) }
    hash_food_name_count = food_name.zip(food_count).to_h
    return hash_food_name_count.sort_by { |key, value| value}.last(10)
  end

  def number_of_orders_per_day
    school_meal_date = PreparingUserMeal.all.map { |preparation| preparation.serving.school_meal.date if preparation.serving.school_meal.school == current_admin.school }.compact
    number_of_servings = school_meal_date.map { |number| school_meal_date.count(number) }
    hash_school_meal_count = school_meal_date.zip(number_of_servings).to_h
  end

  def number_of_preferences
    list_of_preferences = JoinTableProfilePreference.all.map { |i| i.preference.name if i.profile.school == current_admin.school }.compact
    categories_of_preferences = JoinTableProfilePreference.all.map { |i| i.preference.name if i.profile.school == current_admin.school }.compact.uniq
    prefences_count =  categories_of_preferences.map { |category| list_of_preferences.count(category) }
    hash_of_preferences = categories_of_preferences.zip(prefences_count).to_h
  end

  def number_of_students
    students = Array.new 
    Profile.all.each do |profile| 
      students << profile if current_admin.school == profile.school
    end
    return students.count
  end

  def stock_quantity
    stock = Array.new
    Quantity.all.each { |quantity| stock << quantity if current_admin.school == quantity.school }
    return stock.count
  end

  def number_of_servings
    servings = Serving.all.map { |meal| meal if meal.school_meal.school == current_admin.school }.compact
    return servings.count
  end

  def tomorrow_menu_exist?
    tomorrow_meal = SchoolMeal.find_by(date: Date.tomorrow, school_id: current_admin.school.id)
    tomorrow_servings = tomorrow_meal.servings
    if tomorrow_meal != nil && tomorrow_servings.empty?
      true
    else
      false
    end
  end

end