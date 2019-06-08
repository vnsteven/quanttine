class SchoolMealsController < ApplicationController
  def index
    @school_meals = SchoolMeal.all.order("date DESC")
  end

  def new
    @school_meals = SchoolMeal.where(date: Date.tomorrow).order("created_at ASC")
  end

  def create
    @food_supply = FoodSupply.find_by(name: params[:food_name])

    if SchoolMeal.find_by(date: params[:date], school_id: current_admin.school_id) != nil
      @school_meals = SchoolMeal.create!(date: params[:date], school_id: current_admin.school_id)
    else 
      @school_meals = SchoolMeal.find_by(date: params[:date], school_id: current_admin.school_id)
    end

    @servings = Serving.create!(meal_category: params[:meal_category], school_meal_id: @school_meals.id, food_supply_id: @food_supply.id)
    
    if @servings.save
      redirect_to new_admin_school_meal_path(current_admin.id)
      flash[:success] = "Aliment ajouté"
    else
      render "new"
      flash[:error]
    end
  end
end
