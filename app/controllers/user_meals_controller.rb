class UserMealsController < ApplicationController
  def index

  end

  def create
   @profile = User.find(current_user.id).profile

   puts "****************** HELLO WORLD ****************"

   @school_meals = @profile.school.school_meals.find_by(date: Date.tomorrow)
   @starters = @school_meals.servings.where(meal_category: "entrée")
   @main_dishes = @school_meals.servings.where(meal_category: "plat")
   @desserts = @school_meals.servings.where(meal_category: "dessert")
   @sides = @school_meals.servings.where(meal_category: "accompagnement")
redirect_to root_path
 end

 def edit
 end

 def update
 end

 def destroy
 end
end
