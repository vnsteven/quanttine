class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email, :password])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name,:email,:password])
  end

  def after_sign_in_path_for(resource)
    if resource.class == User
      user_profile_path(current_user, current_user.profile)
    elsif resource.class == Admin && current_admin.school.active == true
      admin_path(current_admin)
    elsif resource.class == Admin && current_admin.school.active == false
      new_payment_path
    end  
  end
end
