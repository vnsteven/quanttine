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
    return today.strftime("20%y-%m-%d")
  end  

  def tomorrow_france
    today = Time.now + (24 * 60 * 60)
    return today.strftime("%d-%m-20%y")
  end

  def food_supply_list
    FoodSupply.all.map { |food| food.name }.uniq.sort
  end

  def preferences_list(profile)
    profile.preferences.map { |preference| preference.name }.join(", ").downcase.capitalize
  end

  def serving_list
    Serving.all.map { |serving| serving.meal_category }.uniq
  end

  def hash_of_what_users_have_ordered
    food_name = FoodSupply.all.map { |food| food.name }.uniq
    food_count = food_name.map { |name| Serving.all.map { |i| i.food_supply.name }.count(name) }
    hash_food_name_count = food_name.zip(food_count)
    return hash_food_name_count.sort_by { |key, value| value}.last(5)
  end

  def is_school_of_admin(input)
    input.school == current_admin.school
  end
end
