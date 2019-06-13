class RegistrationsController < Devise::RegistrationsController  


  protected

  def after_update_path_for(resource)
    edit_user_profile_path(resource, resource.profile)
  end

end
