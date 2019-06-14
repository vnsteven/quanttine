class SchoolMealsController < ApplicationController

  def show
    @user = User.find(current_user.id)
    @profile = @user.profile
    @school_meals = @profile.school.school_meals.find_by(date: Date.tomorrow)
    @starters = @school_meals.servings.where(meal_category: "Entrée")
    @main_dishes = @school_meals.servings.where(meal_category: "Plat")
    @desserts = @school_meals.servings.where(meal_category: "Dessert")
    @sides = @school_meals.servings.where(meal_category: "Accompagnement")
  end

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


