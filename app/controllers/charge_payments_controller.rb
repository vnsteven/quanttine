class ChargePaymentsController < ApplicationController
  before_action :authenticate_admin!

  def new
  end

  def create
    service = StripeChargeService.new(params, current_admin, 50)
    service.perform
  end

end
