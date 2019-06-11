class MonthlyPaymentsController < ApplicationController
  before_action :authenticate_admin!

  def new
    @amount = 100
  end

  def create
    @amount = 100
    service = StripeMonthlySubscriptionService.new(permitted_params, current_admin)
    service.perform
  end

  def update
    service = StripeMonthlySubscriptionService.new(params, current_admin)
    service.unsubscribe
  end


  def permitted_params
    params.permit(:stripeToken, :stripeEmail)
  end

end
