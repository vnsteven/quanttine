class ServingsController < ApplicationController
  def destroy
    @serving = Serving.find_by(id: params[:id])
    @school_meal = @serving.school_meal
    @school_meal.destroy
    @serving.destroy
    redirect_to new_admin_school_meal_path(current_admin)
    flash[:success] = "Aliment supprimé"
  end
end
