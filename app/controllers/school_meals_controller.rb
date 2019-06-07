class SchoolMealsController < ApplicationController
  def index
    @school_meals = SchoolMeal.all
  end

  def show
    @user = User.find(current_user.id)
    @profile = @user.profile
    @school_meals = @profile.school.school_meals.find_by(date: Date.tomorrow)
    @starters = @school_meals.servings.where(meal_category: "entrée")
    @main_dishes = @school_meals.servings.where(meal_category: "plat")
    @desserts = @school_meals.servings.where(meal_category: "dessert")
    @sides = @school_meals.servings.where(meal_category: "accompagnement")

  end
end
