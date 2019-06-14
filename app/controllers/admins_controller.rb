class AdminsController < ApplicationController

  def show
    helpers.current_daily_service
  end
  
end
