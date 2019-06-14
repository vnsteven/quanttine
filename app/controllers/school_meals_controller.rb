class SchoolMealsController < ApplicationController
  def destroy
    if no_menu_tomorrow
      redirect_to new_admin_serving_path(current_admin)
      flash[:error] = "Le menu de demain n'existe pas ! Impossible de le supprimer..."
    else
      @school_meal = SchoolMeal.find_by(date: Date.tomorrow, school_id: current_admin.school.id)
      @school_meal.servings.destroy_all
      redirect_to new_admin_serving_path(current_admin)
      flash[:success] = "Menu supprimé"
    end
  end

  def no_menu_tomorrow
    SchoolMeal.find_by(date: Date.tomorrow).nil?
  end
end


