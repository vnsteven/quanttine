class StripeSubscriptionService
attr_accessor :plan, :customer, :subscription, :current_admin

  def initialize(params, current_admin, amount)
    @stripe_email = params[:stripeEmail]
    @stripe_token = params[:stripeToken]
    @current_admin = current_admin
    @amount = amount
    @customer = nil
    @plan = nil
    @subscription = nil
  end

  def perform
    create_plan
    create_customer
    create_subscription

  end

  def create_plan
    @plan = Stripe::Plan.create({
      currency: 'eur',
      interval: 'month',
      product: 'prod_FCpLQuB8RMKYsm',
      nickname: 'plan mensuel basique',
      amount: @amount
      })
  end

  def create_customer
      @customer = Stripe::Customer.create({
        email: @stripe_email,
        source: @stripe_token
        })
  end

  def create_subscription
        @subscription = @customer.subscriptions.create(
          plan: @plan
        )
  end


end
