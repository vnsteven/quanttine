class DailyServicesController < ApplicationController
  before_action :set_daily_service, only: [:show]

  def show

  end

  private

  def set_daily_service
    @daily_service = DailyService.find_by(
      school_id: current_admin.school.id
    )
  end

end
