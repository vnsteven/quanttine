class HomeController < ApplicationController
  def index
    @profile = Profile.find_by(user_id: current_user.id) if user_signed_in?
  end
end
