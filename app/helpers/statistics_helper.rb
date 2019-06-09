module StatisticsHelper
  def hash_of_what_users_have_ordered
    food_name = PreparingUserMeal.all.map { |i| i.serving.food_supply.name }
    food_count = food_name.map { |name| food_name.count(name) }
    hash_food_name_count = food_name.zip(food_count).to_h
    return hash_food_name_count.sort_by { |key, value| value}.last(10)
  end

  def hash_of_number_of_orders_per_day
    school_meal_date = PreparingUserMeal.all.map { |preparation| preparation.serving.school_meal.date }
    number_of_servings = school_meal_date.map{|number| school_meal_date.count(number)}
    hash_school_meal_count = school_meal_date.zip(number_of_servings).to_h
  end
end
