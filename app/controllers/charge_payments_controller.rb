class ChargePaymentsController < ApplicationController
  before_action :authenticate_admin!

  def new
  end

  def create
    service = StripeChargeService.new(params, current_admin, 50)
    service.create_customer
    service.create_charge
    byebug
  end

end
