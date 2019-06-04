class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email, :password])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name,:email,:password])
  end

  def after_sign_in_path_for(resource)
    "/users/#{current_user.id}/dashboard"
  end
end
