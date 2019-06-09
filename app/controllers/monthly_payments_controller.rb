class MonthlyPaymentsController < ApplicationController
  before_action :authenticate_admin!

  def new
    @amount = 100
  end

  def create
    @amount = 100
    service = StripeMonthlySubscriptionService.new(params, current_admin, @amount)
    service.perform
  end

end
