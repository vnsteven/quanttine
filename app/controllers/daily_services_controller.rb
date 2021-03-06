class DailyServicesController < ApplicationController
  before_action :set_daily_service, only: [:show, :edit, :update]

  def edit
    @queue = @daily_service.queue
  end

  def update
    queue = @daily_service.queue
    queue.delete_at(params[:index].to_i)
    @daily_service.update(queue: queue)
    respond_to do |format|
      format.html { redirect_to edit_admin_daily_service(current_admin, params[:id]) }
      format.js { }
    end
  end

  private

  def set_daily_service
    @daily_service = DailyService.find_by(
      date: Date.today,
      school_id: current_admin.school.id
    )
  end

  def permitted_parameters
    params.permit(:index)
  end

end
