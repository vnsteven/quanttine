class ServingsController < ApplicationController
  def index
    @school_meals = SchoolMeal.all.order("date DESC")
  end

  def new
    @school_meals = SchoolMeal.where(date: Date.tomorrow)
  end

  def create
    @food_supply = FoodSupply.find_by(name: params[:food_supply])

    @school_meal = SchoolMealConditionService.new(params[:date], current_admin.school.id).perform

    @food_serving = Serving.create!(meal_category: params[:meal_category], school_meal_id: @school_meal.id, food_supply_id: @food_supply.id)

    if @food_serving.save
      respond_to do |format|
        format.html { redirect_to new_admin_serving_path(current_admin) }
        format.js { }
      end
    else
      render "new"
      flash[:error] = "Ça n'a pas marché"
    end
  end
  
  def destroy
    @serving = Serving.find_by(id: params[:id])
    @serving.destroy
    respond_to do |format|
      format.html { redirect_to new_admin_serving_path(current_admin) }
      format.js { }
    end
  end
end
