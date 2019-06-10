class MonthlyPaymentsController < ApplicationController
  before_action :authenticate_admin!

  def new
    @amount = 100
  end

  def create
    @amount = 100
    service = StripeMonthlySubscriptionService.new(params, @amount, current_admin)
    service.perform
  end

  def update
    service = StripeMonthlySubscriptionService.new(params, @amount, current_admin)
    service.unsubscribe
  end

end