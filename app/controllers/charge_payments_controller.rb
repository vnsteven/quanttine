class ChargePaymentsController < ApplicationController
  before_action :authenticate_admin!

  def new
  end

  def create
    @amount = 600
    service = StripeChargeService.new(params, current_admin, @amount)
    service.perform
  end

end
