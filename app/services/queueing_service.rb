class QueueingService
  attr_accessor :params, :daily_service, :school_id, :profile_id

  def initialize(params)
    @params = params
    @current_date = params[:current_date].to_date
    @school_id = params[:school_id].to_i
    @profile_id = params[:profile_id].to_i
  end

  # the purpose of the QueueingService is to put profile ids scanned from the python script
  # into a daily_service's queue.
  # The goal of the queue is to have an order from which
  # canteen staff can serve student's meal (according to their place inside the daily_service's
  # i.e. according to the order of which they scanned their respective qr code)
  # 1. data from the python script's requests is validated through the VALIDATE_DATA_FROM_REQUESTS' method
  # 2. if data is to be found in the database, the EXECUTE_QUEUEING methods will run
  # and look for a daily_service in the database and retrieve it thanks to the RETRIEVE_DAILY_SERVICE method.
  # otherwise it will run the CREATE_DAILY_SERVICE method.
  # 3. both of these methods return a daily_service record
  # 4. inside which the profile ids will be put in queue.

  def perform
    validate_data_from_requests
  end

  def validate_data_from_requests # making sure that data from requests are valid before executing actions
    if Profile.exists?(@profile_id) && School.exists?(@school_id)
      puts "Profile found with id equal to #{@profile_id}."
      puts "School found with id equal to #{@school_id}."
      puts "Processing the queueing service ..."
      execute_queueing # if both profile_id and school_id exist in the database, the queueing service will run this the execute_queueing method
    elsif !Profile.exists?(@profile_id) # if profile_id does not exists in the database
      puts "No profile found with id equal to #{@profile_id}."
    elsif !School.exists?(@school_id) # if school_id does not exists in the database
      puts "No school found with id equal to #{@school_id}."
    else
      puts "No profile found with id equal to #{@profile_id}."
      puts "No school found with id equal to #{@school_id}."
    end
  end

  def create_daily_service
    @daily_service = DailyService.create!(
      date: @current_date,
      school_id: @school_id)
    @daily_service.queue << @profile_id # queueing the profile_id to the daily_service's queue
    puts "queueing the profile_id n°#{@profile_id} to the newly created daily_service object n°#{@daily_service.id}."
    puts
    puts @daily_service.queue # queueing the profile_id to the daily_service
    @daily_service.save
  end

  def retrieve_daily_service
    @daily_service = DailyService.find_by_date_and_school_id(
      @current_date,
      @school_id)
  end

  def execute_queueing # the execute_queueing method will either retrieve an existing daily_service or create a new one
    if DailyService.find_by_date_and_school_id(
      @current_date,
      @school_id)

      retrieve_daily_service # if a daily_service is found, the service object will retrieve it

      @daily_service.queue << @profile_id # queueing the profile_id to the daily_service
      @daily_service.save
      puts "queueing profile_id n°#{@profile_id} to the daily_service object n°#{@daily_service.id} that was fetched from the database."
      puts
      puts @daily_service.queue
    else
      create_daily_service # if the daily_service is not found in the database, the service object will create it
    end
  end

end
