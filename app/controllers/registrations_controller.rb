class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    "/users/#{current_user.id}/profiles"
  end
end
