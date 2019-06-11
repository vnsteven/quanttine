class ApiController < ApplicationController

  def index
  end

  def show
  end

  def new
  end

  def create
    queueing
  end

  private

  def queueing
    if DailyService.find_by_date_and_school_id(
      params[:current_date],
      params[:school_id])
    @daily_service = DailyService.find_by_date_and_school_id(params[:current_date], params[:school_id])
      @daily_service.queue << params[:profile_id]
      @daily_service.save
      puts "queueing the daily_service object that was fetched from the database"
      puts @daily_service.queue
    else
    @daily_service = DailyService.create!(date: params[:current_date], school_id: params[:school_id])
    @daily_service.queue << params[:profile_id]
    puts "queueing the daily_service object that was just created by the script"
    puts @daily_service.queue
    @daily_service.save
    end
  end

def permitted_parameters
  params.permit('school_id', 'current_date', 'profile_id')

end

end
