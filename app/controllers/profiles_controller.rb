class ProfilesController < ApplicationController
  before_action :authenticate_user
  before_action :restrict_access, only: [:edit, :show]
  before_action :set_user, :set_profile, only: [:show, :edit, :update, :destroy]

  def index
    @profile = Profile.all
  end

  def show
  end

  def edit
    @preferences = Preference.all
    @schools = School.all
    @qr = QrCodeService.new(@profile.id)
  end

  def update
    @profile.update(profile_parameters)
    @profile.update(school_parameters)
  end

  private

  def set_user # keeping it dry !
    @user = current_user
  end

  def set_profile
    @profile = Profile.find_by(user_id: current_user.id)
  end

  def profile_parameters
    params.require(:profile).permit(
      preference_ids: []
    )
  end

  def school_parameters
    params.require(:profile).permit(:school_id)
  end

  def authenticate_user
    unless current_user || current_admin
      redirect_to root_path, notice: "Veuillez vous connecter pour accéder à vos informations."
    end
  end

  def restrict_access
    @profile = Profile.find_by(user_id: current_user.id)
    if @profile.id != current_user.profile.id
      redirect_to root_path, notice: "Vous n'avez pas accès à ces informations."
    end
  end

end
