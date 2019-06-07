class SubscriptionPaymentsController < ApplicationController
  before_action :authenticate_admin!

  def new
  end

  def create
    service = StripeSubscriptionService.new(params, current_admin, 50)
    service.perform
    redirection(service)
  end
  
  private

  def redirection(service)
    if service.plan == nil || service.customer == nil || service.subscription == nil
      redirect_to new_subscription_payment_path
    else
      redirect_to admin_path(current_admin)
    end
  end

end
