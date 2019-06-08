class SchoolMealsController < ApplicationController
  def index
    @school_meals = SchoolMeal.all.order("date DESC")
  end

  def new
    @school_meals = SchoolMeal.where(date: Date.tomorrow)
  end

  def create
    @food_supply = FoodSupply.find_by(name: params[:food_name])
    @school_meals = SchoolMeal.create!(date: params[:date], school_id: current_admin.school_id)
    @servings = Serving.create!(meal_category: params[:meal_category], school_meal_id: @school_meals.id, food_supply_id: @food_supply.id)
    if @school_meals.save && @servings.save
      redirect_to new_admin_school_meal_path(current_admin.id)
      flash[:success] = "Le repas a bien été créé"
    else
      render "new"
      flash[:error]
    end
  end
end
