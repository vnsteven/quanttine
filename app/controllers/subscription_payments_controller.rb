class SubscriptionPaymentsController < ApplicationController
  before_action :authenticate_admin!

  def new
  end

  def create
    service = StripeSubscriptionService.new(params, current_admin, 50)
    redirect_to admin_path(current_admin) if service.perform
  end

end
