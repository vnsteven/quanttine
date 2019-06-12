module UserMealsHelper

  def todays_order
    current_user.profile.user_meals.where("created_at >= ?", Time.zone.now.beginning_of_day)
  end


end
