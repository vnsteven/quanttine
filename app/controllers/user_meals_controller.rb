class UserMealsController < ApplicationController
  def index
  end

  def new
   @profile = User.find(current_user.id).profile
   @school_meals = @profile.school.school_meals.find_by(date: Date.tomorrow)
   @starters = @school_meals.servings.where(meal_category: "entrée")
   @main_courses = @school_meals.servings.where(meal_category: "plat")
   @desserts = @school_meals.servings.where(meal_category: "dessert")
   @sides = @school_meals.servings.where(meal_category: "accompagnement")

   @user_meal = UserMeal.new
puts "ICI CONNECTÉ AVEC #{current_user.profile.id}"
 end

 def create
  @profile = current_user.profile
  @user_meal = UserMeal.create(profile_id: @profile.id)
  puts "ok user meal créé avec pour id #{@user_meal.id}"
  PreparingUserMeal.create!(user_meal_id: @user_meal.id, serving_size: 100, serving_id: params(:starter_choice))
  PreparingUserMeal.create!(user_meal_id: @user_meal.id, serving_size: 100, serving_id: params(:main_course_choice))
  PreparingUserMeal.create!(user_meal_id: @user_meal.id, serving_size: 100, serving_id: params(:dessert_choice))

  if @user_meal.save
    puts "CA MARCHEEEEEEEEEEEEEEEEEE"
  else

    puts "faileeeeeeeeeeeeed"
  end

end



def edit
end

def update
end

def destroy
end

end
