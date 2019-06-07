module ApplicationHelper
  def bootstrap_class_for_flash(type)
    case type
    when 'notice' then "alert-info"
    when 'success' then "alert-success"
    when 'error' then "alert-danger"
    when 'alert' then "alert-warning"
    end
  end

  def serving_list
    Serving.all.map { |serving| serving.meal_category }.uniq
  end

  def food_supply_list
    FoodSupply.all.map { |food| food.name }.uniq
  end

  def preferences_list(profile)
    profile.preferences.map { |preference| preference.name }.join(", ").downcase.capitalize
  end

  def preferences_categories
    Preference.all.map { |preference| preference.name }.uniq
  end

  def preference_count(category)
    Preference.all.map { |i| i.name }.count(category)
  end

  def what_users_have_ordered(food_name)
    Serving.all.map { |i| i.food_supply.name }.count(food_name)
  end
end
