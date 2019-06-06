class ProfilesController < ApplicationController
	def index
		@user = User.find(current_user.id)
		@profile = Profile.find_by(user_id: current_user.id)
	end



  def edit
    @user = User.find(params[:user_id])
    @profile = Profile.find(params[:id])
    @preferences = Preference.all
  end


	def update
		@profile = Profile.find_by(user_id: current_user.id)
		@profile.update(profile_parameters)
	end

	private

	def profile_parameters
		params.require(:profile).permit(
			preference_ids: []
		)

	end



end
