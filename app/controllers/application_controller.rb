class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email, :password])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name,:email,:password])
  end

  def after_sign_in_path_for(resource)
    user_profiles_path(current_user) if resource.class == User
    admin_path(current_admin) if resource.class == Admin && current_admin.school.active == true
    new_payment_path if resource.class == Admin && current_admin.school.active == false

  end
end
