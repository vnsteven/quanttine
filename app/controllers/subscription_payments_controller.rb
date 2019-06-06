class SubscriptionPaymentsController < ApplicationController
  before_action :authenticate_admin!

  def new
    @amount = 50000000
  end

  def create
    @amount = 50000000
    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      subscription_data: {
        items: [{
          plan: 'plan_123',
          }],
        },
        success_url: 'https://example.com/success',
        cancel_url: 'https://example.com/cancel',
      )
    end

  end
