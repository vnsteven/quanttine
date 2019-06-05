class ProfilesController < ApplicationController
	def index
		@user = User.find(params[:user_id])
		@profile = Profile.find_by(user_id: current_user.id)
	end

  def show
    @user = User.find(params[:user_id])
    @profile = Profile.find_by(user_id: current_user.id)

    @preferences = Preference.all
  end
end
