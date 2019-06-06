class SchoolMealsController < ApplicationController
  def index
    @school_meals = SchoolMeal.all
  end
end
