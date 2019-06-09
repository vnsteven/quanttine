module ApplicationHelper
  def bootstrap_class_for_flash(type)
    case type
    when 'notice' then "alert-info"
    when 'success' then "alert-success"
    when 'error' then "alert-danger"
    when 'alert' then "alert-warning"
    end
  end

  def tomorrow
    today = Time.now + (24 * 60 * 60)
    return today.strftime("%Y-%m-%d")
  end  

  def tomorrow_france
    today = Time.now + (24 * 60 * 60)
    return today.strftime("%d-%m-20%y")
  end

  def food_supply_list
    FoodSupply.all.map { |food| food.name }.uniq.sort
  end

  def serving_list
    Serving.all.map { |serving| serving.meal_category }.uniq
  end

  def preferences_list(profile)
    profile.preferences.map { |preference| preference.name }.join(", ").downcase.capitalize
  end

  def hash_of_what_users_have_ordered
    food_name = food_supply_list
    food_count = food_name.map { |name| Serving.all.map { |i| i.food_supply.name }.count(name) }
    hash_food_name_count = food_name.zip(food_count)
    return hash_food_name_count.sort_by { |key, value| value}.last(10)
  end

  def hash_of_number_of_orders_per_day
    school_meal_date = Serving.all.map { |serving| serving.school_meal.date }
    number_of_servings = school_meal_date.map{|number| school_meal_date.count(number)}
    hash_school_meal_count = school_meal_date.zip(number_of_servings)
  end

  def is_school_of_admin(input)
    input.school == current_admin.school
  end
end
