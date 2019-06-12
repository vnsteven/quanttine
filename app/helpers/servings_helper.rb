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
end
