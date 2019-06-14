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
    flash[:notice] = "Payement effectué avec succès !"
    service = StripeMonthlySubscriptionService.new(params, current_admin)
    service.unsubscribe
    redirect_to root_path
    flash[:success] = "Vous avez bien été désabonné du payement mensuel !"
  end


  def permitted_params
    params.permit(:stripeToken, :stripeEmail)
  end

end
