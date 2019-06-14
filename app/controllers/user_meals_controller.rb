class UserMealsController < ApplicationController
  before_action :set_variables
  before_action :has_ordered, only: [:destroy, :show]
  before_action :has_not_ordered, only: [:create]
  before_action :menu_tomorrow, only: [:new]

  def new
    @school_meals = @profile.school.school_meals.find_by(date: Date.tomorrow)
    @user_meal_service = UserMealService.new(@school_meals)
    @user_meal = UserMeal.new
    @todays_order = @profile.user_meals.where("created_at >= ?", Time.zone.now.beginning_of_day).last
  end

  def create
    if choose_a_full_meal
      @user_meal = UserMeal.create!(profile_id: @profile.id)
      params[:user_meal].each do |param, value|
        PreparingUserMeal.create!(user_meal_id: @user_meal.id, serving_size: 100, serving_id: value.to_i)
      end
      redirect_to user_profile_user_meal_path(@user, @profile, @user_meal.id)
    else
      redirect_to new_user_profile_user_meal_path(@user, @profile)
      flash[:error] = "Tu dois choisir une entrée, un plat avec accompagnement et un dessert"
    end
  end

  def index
    @user = current_user
    @profile = User.find(current_user.id).profile
    @meals = current_user.profile.user_meals
  end

  def show
    @servings = @profile.user_meals.last.servings
  end

  def destroy
    @todays_order = current_user.profile.user_meals.where("created_at >= ?", Time.zone.now.beginning_of_day).last
    todays_order.destroy_all
    redirect_to new_user_profile_user_meal_path(@user.id, @profile.id)
    flash[:notice] = "Votre choix pour le menu du jour a bien été supprimé"
  end

  private
  def todays_order
    current_user.profile.user_meals.where("created_at >= ?", Time.zone.now.beginning_of_day)
  end

  def has_ordered
    @user = current_user
    @profile = current_user.profile
    unless todays_order.exists?
      flash[:error] = "Tu n'as pas passé de commande !"
      redirect_to new_user_profile_user_meal_path(@profile, @user)
    end
  end

  def has_not_ordered
    @user = current_user
    @profile = current_user.profile
    unless todays_order.empty?
     flash[:error] = "Tu as déjà passé commande !"
     redirect_to user_profile_user_meal_path(@profile, @user, @user_meal.last.id)
   end
 end

 def menu_tomorrow
  @user = current_user
  @profile = current_user.profile
  if current_user.profile.school.school_meals.find_by(date: Date.tomorrow).servings.empty?
    redirect_to user_profile_path(@user, @profile)
    flash[:error] = "Votre école n'a pas encore créé le menu de demain ! Revenez plus tard..."
  end
end

def choose_a_full_meal
  !params[:user_meal].nil? && params[:user_meal].has_key?("starter_choice") && params[:user_meal].has_key?("main_course_choice") && params[:user_meal].has_key?("side_choice") && params[:user_meal].has_key?("dessert_choice")
end

def set_variables
  @profile = current_user.profile
  @user = current_user
end
end
