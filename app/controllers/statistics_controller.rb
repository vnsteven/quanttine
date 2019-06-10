class StatisticsController < ApplicationController
  def index
    @preferences = Preference.all
  end
end
