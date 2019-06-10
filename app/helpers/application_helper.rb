module ApplicationHelper
  def bootstrap_class_for_flash(type)
    case type
    when 'notice' then "alert-info"
    when 'success' then "alert-success"
    when 'error' then "alert-danger"
    when 'alert' then "alert-warning"
    end
  end

  def tomorrow
    today = Time.now + (24 * 60 * 60)
    return today.strftime("%Y-%m-%d")
  end  

  def school_meal
    SchoolMeal.where(date: Date.tomorrow)
  end
end
