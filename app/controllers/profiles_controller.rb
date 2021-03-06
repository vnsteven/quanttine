class ProfilesController < ApplicationController
  before_action :authenticate_user
  before_action :restrict_access, only: [:edit, :show]
  before_action :set_user, :set_profile, only: [:show, :edit, :update, :destroy]

  def index
    @profile = Profile.all
  end

  def show
		@user = User.find(current_user.id)
		@profile = Profile.find_by(user_id: current_user.id)
    @meal = @profile.school.school_meals.find_by(date: Date.tomorrow)
  end

  def edit
    @preferences = Preference.all
    @schools = School.all
    @school = current_user.profile.school
  end

  def update
    @profile.update(profile_parameters)
    redirect_to edit_user_profile_path(@user.id, @profile.id), notice: "Préférences enregistrées"
  end

  private

  def set_user # keeping it dry !
    @user = current_user
  end

  def set_profile
    @profile = Profile.find_by(user_id: current_user.id)
  end

  def profile_parameters
    params.require(:profile).permit(:school_id,
      preference_ids: []
    )
  end

  def school_parameters
    params.require(:profile).permit(:school_id)
  end

  def authenticate_user
    unless current_user || current_admin
      redirect_to root_path, notice: "Il faut te connecter pour accéder à tes informations."
    end
  end

  def restrict_access
    @profile = Profile.find_by(user_id: current_user.id)
    if @profile.id != current_user.profile.id
      redirect_to root_path, notice: "Tu n'as pas accès à ces informations."
    end
  end

end
