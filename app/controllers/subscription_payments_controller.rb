class SubscriptionPaymentsController < ApplicationController
  before_action :authenticate_admin!

  def new
    @amount = 50000000
  end

  def create
    @amount = 50000000

    plan = Stripe::Plan.create({
      currency: 'eur',
      interval: 'month',
      product: 'prod_FCpLQuB8RMKYsm',
      nickname: 'plan basique',
      amount: @amount
      })

    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })

    subscription = customer.subscriptions.create(
      plan: plan
    )

    options = {
      stripe_id: customer.id,
      stripe_subscription_id: subscription.id
    }

    options.merge!(
      card_last4: params[:card_last4],
      card_exp_month: params[:card_exp_month],
      card_exp_year: params[:card_exp_year],
      card_type: params[:card_brand]
    )

    redirect_to root_path

  rescue Stripe::CardError => e
    flash[:error] = e.message
    byebug
    redirect_to new_charge_payment_path
  end

end
