class UserMealsController < ApplicationController
  before_action :set_variables
  before_action :has_ordered, only: [:destroy, :show]
  before_action :has_not_ordered, only: [:create]
  before_action :menu_tomorrow, only: [:new]


  def new
    @school_meals = @profile.school.school_meals.find_by(date: Date.tomorrow)
    @starters = @school_meals.servings.where(meal_category: "entrée")
    @main_courses = @school_meals.servings.where(meal_category: "plat")
    @desserts = @school_meals.servings.where(meal_category: "dessert")
    @sides = @school_meals.servings.where(meal_category: "accompagnement")
    @user_meal = UserMeal.new
    @todays_order = @profile.user_meals.where("created_at >= ?", Time.zone.now.beginning_of_day).last
  end

  def create
    @user_meal = UserMeal.create!(profile_id: @profile.id)
    PreparingUserMeal.create!(user_meal_id: @user_meal.id, serving_size: 100, serving_id: params[:user_meal][:starter_choice].to_i)
    PreparingUserMeal.create!(user_meal_id: @user_meal.id, serving_size: 100, serving_id: params[:user_meal][:main_course_choice].split[0].to_i)
    PreparingUserMeal.create!(user_meal_id: @user_meal.id, serving_size: 100, serving_id: params[:user_meal][:main_course_choice].split[1].to_i)
    PreparingUserMeal.create!(user_meal_id: @user_meal.id, serving_size: 100, serving_id: params[:user_meal][:dessert_choice].to_i)
    redirect_to user_profile_user_meal_path(@user, @profile, @user_meal.id)
  end

  def show
    @servings = @profile.user_meals.last.servings
  end

  def destroy
    @todays_order = current_user.profile.user_meals.where("created_at >= ?", Time.zone.now.beginning_of_day).last
    todays_order.destroy_all
    redirect_to user_profile_path(@user, @profile)
    flash[:success] = "Votre choix pour le menu du jour a bien été supprimé"
  end

  private
  def todays_order
    current_user.profile.user_meals.where("created_at >= ?", Time.zone.now.beginning_of_day)
  end

  def has_ordered
    @user = current_user
    @profile = current_user.profile
    unless todays_order.exists?
      flash[:error] = "Vous n'avez pas passé de commande !"
      redirect_to new_user_profile_user_meal_path(@profile, @user)
    end
  end

  def has_not_ordered
    @user = current_user
    @profile = current_user.profile
    unless todays_order.empty?
     flash[:error] = "Vous avez déjà passé commande !"
     redirect_to user_profile_user_meal_path(@profile, @user, @user_meal.last.id)
   end
 end

 def menu_tomorrow
  @user = current_user
  @profile = current_user.profile
  if current_user.profile.school.school_meals.find_by(date: Date.tomorrow).nil?
    redirect_to user_profile_path(@user, @profile)
    flash[:error] = "Votre école n'a pas encore créé le menu de demain ! Revenez plus tard..."
  end
end

def set_variables
  @profile = current_user.profile
  @user = current_user
end



end
