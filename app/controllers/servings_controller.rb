class ServingsController < ApplicationController
  def index
    @school_meals = SchoolMeal.where(school_id: current_admin.school.id)
  end

  def new
    @school_meal = SchoolMeal.find_by(date: Date.tomorrow, school_id: current_admin.school.id)
    @servings = @school_meal.servings  
  end

  def create
    @food_supply = FoodSupply.find_by(name: params[:food_supply])
    @school_meal = SchoolMealConditionService.new(Date.tomorrow, current_admin.school.id).perform
    @food_serving = ServingConditionService.new(params[:meal_category], @school_meal, @food_supply).perform
    respond_to do |format|
      format.html { redirect_to new_admin_serving_path(current_admin) }
      format.js { flash[:success] = "#{@food_supply.name} a été ajouté en #{params[:meal_category]}" }
    end
  end

  def destroy
    @serving = Serving.find_by(id: params[:id])
    @serving.destroy
    respond_to do |format|
      format.html { redirect_to new_admin_serving_path(current_admin) }
      format.js { flash[:success] = "Aliment supprimé" }
    end
  end
end
