class UserMealsController < ApplicationController

  def new
    @user = current_user
    @profile = User.find(current_user.id).profile
    @school_meals = @profile.school.school_meals.find_by(date: Date.tomorrow)
    @starters = @school_meals.servings.where(meal_category: "entrée")
    @main_courses = @school_meals.servings.where(meal_category: "plat")
    @desserts = @school_meals.servings.where(meal_category: "dessert")
    @sides = @school_meals.servings.where(meal_category: "accompagnement")
    @user_meal = UserMeal.new
  end

  def create
    @profile = current_user.profile
    @user = current_user
    @user_meal = UserMeal.create!(profile_id: @profile.id)
    PreparingUserMeal.create!(user_meal_id: @user_meal.id, serving_size: 100, serving_id: params[:user_meal][:starter_choice].to_i)
    PreparingUserMeal.create!(user_meal_id: @user_meal.id, serving_size: 100, serving_id: params[:user_meal][:main_course_choice].to_i)
    PreparingUserMeal.create!(user_meal_id: @user_meal.id, serving_size: 100, serving_id: params[:user_meal][:dessert_choice].to_i)
    redirect_to user_profile_user_meal_path(@user, @profile, @user_meal.id)
  end

  def show
    @profile = current_user.profile
    @user_meal = @profile.user_meals.last.servings
  end


  def destroy

  end



  def self.today
    where("created_at >= ?", Time.zone.now.beginning_of_day)
  end

  def has_booked_today
    return true if self.today.!nil
    end






  end
