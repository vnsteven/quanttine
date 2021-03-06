class SubscriptionPaymentsController < ApplicationController
  before_action :authenticate_admin!

  def create
    @amount = 50
    service = StripeSubscriptionService.new(params, @amount, current_admin)
    service.perform
  end

end
