class ApiController < ApplicationController
  protect_from_forgery unless: -> { request.format.json? }, only: [:create]
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    QueueingService.new(params).perform
  end

end
