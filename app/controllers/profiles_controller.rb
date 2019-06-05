class ProfilesController < ApplicationController
	def show
		@user = User.find(params[:id])
		@profile = Profile.find_by(user_id: @user.id)
	end
end
