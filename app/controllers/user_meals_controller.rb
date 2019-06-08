class UserMealsController < ApplicationController
  def index
    @profiles = Profile.all
  end

  def destroy
    @user_meal = UserMeal.find(params[:id])
    @user_meal.destroy
    redirect_to admin_user_meals_path(current_admin)
    flash[:success] = "Commande supprimée"
  end
end
