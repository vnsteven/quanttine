module ServingsHelper
  def food_supply_list
    FoodSupply.all.map { |food| food.name }.uniq.sort
  end

  def serving_list
    Serving.all.map { |serving| serving.meal_category }.uniq
  end   
end
