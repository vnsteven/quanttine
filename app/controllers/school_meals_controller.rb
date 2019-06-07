class SchoolMealsController < ApplicationController
  def index
    @school_meals = SchoolMeal.all
  end

  def show
    @user = User.find(current_user.id)
    @profile = @user.profile
    @meals_of_tomorrow = @profile.school.school_meals.find_by(date: Date.tomorrow)

  end
end
