class SchoolMealsController < ApplicationController
  def index
    @school_meals = SchoolMeal.all
  end

  def create
    @school_meals = SchoolMeal.create!(date: params[:date], school_id: current_admin.school_id)
    @servings = Serving.create!(meal_category: params[:meal_category][:meal_name], school_meal_id: @school_meals.id, food_supply_id: params[:food_name][:food_id])
    if @school_meals.save && @servings.save
      redirect_to new_admin_school_meal_path(current_admin.id)
      flash[:success] = "Le repas a bien été créé"
    else
      render "new"
      flash[:error]
    end
  end
end
