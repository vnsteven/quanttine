module ApplicationHelper
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

  def bootstrap_class_for_flash(type)
    case type
    when 'notice' then "alert-info"
    when 'success' then "alert-success"
    when 'error' then "alert-danger"
    when 'alert' then "alert-warning"
    end
  end

  def school_meal
    SchoolMeal.where(date: Date.tomorrow)
  end

   def no_menu_tomorrow
    SchoolMeal.find_by(date: Date.tomorrow).nil?
  end

  def menu_tomorrow
    SchoolMeal.find_by(date: Date.tomorrow).exists?
  end
end
