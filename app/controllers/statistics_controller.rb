class StatisticsController < ApplicationController
  def index
    @preference = User.all
  end
end
