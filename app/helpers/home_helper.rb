module HomeHelper
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def resource_name_admin
    :admin
  end

  def resource_admin
    @resource ||= Admin.new
  end

  def devise_mapping_admin
    @devise_mapping ||= Devise.mappings[:admin]
  end
end
