class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
<<<<<<< HEAD
  
=======
  before_action :login, except: [:index]

>>>>>>> development
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email, :password, :school_code])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name,:email,:password])
  end

  def login
    user = User.find_for_authentication(email: login_params[:email])
    if user.valid_password?(login_params[:password])
      user.remember_me = login_params[:remember_me]
    else
      root_path
      flash[:error] = "E-mail ou mot de passe invalide"
    end
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

  def after_update_path_for(resource)
    root_path
  end
end

private
def login_params
  params.require(:user).permit(:email, :password, :remember_me)
end
