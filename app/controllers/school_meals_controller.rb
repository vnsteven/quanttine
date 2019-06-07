class SchoolMealsController < ApplicationController
  def index
    @school_meals = SchoolMeal.all
  end

  def create
    @school_meals = SchoolMeal.new(date: params[:date], school_id: current_admin.school_id)
    if @school_meals.save
      redirect_to new_admin_school_meal_path(current_admin.id)
      flash[:success] = "Le repas a bien été créé"
    else
      render "new"
      flash[:error]
    end
  end
end
