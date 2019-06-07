class ChargePaymentsController < ApplicationController
  before_action :authenticate_admin!

  def new
  end

  def create
    service = StripeChargeService.new(params, current_admin, 50)
    redirect_to admin_path(current_admin) if service.perform
  end

end
