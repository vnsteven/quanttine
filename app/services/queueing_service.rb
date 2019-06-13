class QueueingService
  attr_accessor :params, :daily_service

  def initialize(params)
    @params = params
  end

  def create_daily_service
    @daily_service = DailyService.create!(
      date: @params[:current_date],
      school_id: @params[:school_id])
    @daily_service.queue << @params[:profile_id]
    puts "queueing the profile_id n°#{@params[:profile_id]} to the newly created daily_service object n°#{@daily_service.id}."
    puts
    puts @daily_service.queue
    @daily_service.save
  end

  def fetch_daily_service
    @daily_service = DailyService.find_by_date_and_school_id(
      @params[:current_date],
      @params[:school_id])
  end

  def perform
    if DailyService.find_by_date_and_school_id(
      @params[:current_date],
      @params[:school_id])

      fetch_daily_service

      @daily_service.queue << @params[:profile_id]
      @daily_service.save
      puts "queueing profile_id n°#{@params[:profile_id]} to the daily_service object n°#{@daily_service.id} that was fetched from the database."
      puts
      puts @daily_service.queue
    else
      create_daily_service
    end
  end

end
