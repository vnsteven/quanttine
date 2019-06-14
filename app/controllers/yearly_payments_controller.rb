class YearlyPaymentsController < ApplicationController
  before_action :authenticate_admin!

  def new
    @amount = 1000
  end

  def create
    @amount = 1000
    service = StripeYearlySubscriptionService.new(params, current_admin)
    service.perform
  end

  def update
    service = StripeYearlySubscriptionService.new(params, current_admin)
    service.unsubscribe
    flash[:success] = "Vous avez bien été désabonné du payement annuel !"
  end

end
