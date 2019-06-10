class PreparingUserMealsController < ApplicationController
  def index
    @preparing_user_meals = PreparingUserMeal.all.order("created_at ASC")
  end

  def destroy
    @preparation = PreparingUserMeal.find(params[:id])
    @preparation.destroy
    respond_to do |format|
      format.html { redirect_to admin_preparing_user_meals_path(current_admin) }
      format.js { }
    end
  end
end
