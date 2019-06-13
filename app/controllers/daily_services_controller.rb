class DailyServicesController < ApplicationController
  before_action :set_daily_service, only: [:show, :edit, :update, :destroy]

  def index

  end

  def show

  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def set_daily_service
    @daily_service = DailyService.find_by(
      school_id: current_admin.school.id
    )
  end

end
