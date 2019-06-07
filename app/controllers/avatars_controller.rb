class AvatarsController < ApplicationController
before_action :authenticate_user!

  def create
    puts params
    @user = User.find(params[:user_id])
    @profile = @user.profile
    @profile.avatar.attach(params[:avatar])
    redirect_to edit_user_profile_path(@user, @profile)
  end
end
