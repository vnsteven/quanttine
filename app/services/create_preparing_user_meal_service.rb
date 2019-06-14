class CreatePreparingUserMealService

  def initialize(params, user_meal)
    @params = params
    @user_meal = user_meal
  end

  def perform
    create_preparing
  end

  private

  def create_preparing
    @params.each do |param, value|
      PreparingUserMeal.create!(user_meal_id: @user_meal.id, serving_size: 100, serving_id: value.to_i)
    end
  end

end
