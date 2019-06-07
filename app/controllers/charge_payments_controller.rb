class ChargePaymentsController < ApplicationController
  before_action :authenticate_admin!

  def new
  end

  def create
    service = StripeChargeService.new(params, current_admin, 50)
    service.perform
    redirection(service)
  end

  private

  def redirection(service)
    if service.customer == nil || service.charge == nil
      redirect_to new_charge_payment_path
    else
      redirect_to admin_path(current_admin)
    end
  end

end
