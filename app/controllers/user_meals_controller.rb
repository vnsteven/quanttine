class UserMealsController < ApplicationController
  def index
    @profiles = Profile.all
  end
end
