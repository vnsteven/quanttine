class JoinTableProfilePreferencesController < ApplicationController
	def update
		@pref = params[:pref]
		JoinTableProfilePreference.create!(
			profile_id: current_user.profile.id, 
			preference_id: @pref)
	end

end
