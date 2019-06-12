class AdminsController < ApplicationController

  def show
    @daily_service = DailyService.find_by(
      date: Date.today.strftime("%d/%m/%Y"),
      school_id: current_admin.school.id
    )
  end

end
