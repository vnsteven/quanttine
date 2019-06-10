class SchoolMealsController < ApplicationController
  def destroy
    @school_meal = SchoolMeal.find_by(date: Date.tomorrow)
    @school_meal.destroy if @school_meal != nil
    redirect_to new_admin_serving_path(current_admin)
  end
end
