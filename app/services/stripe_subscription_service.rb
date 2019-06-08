class StripeSubscriptionService
attr_accessor :plan, :customer, :subscription, :amount

  def initialize(params, amount, current_admin)
    @stripe_email = params[:stripeEmail]
    @stripe_token = params[:stripeToken]
    @amount = amount
    @current_admin = current_admin
  end

  def perform
    create_plan
    create_customer
    create_subscription
    activate_school_status
  end

  def create_plan
    @plan = Stripe::Plan.create({
      currency: 'eur',
      interval: 'month',
      product: 'prod_FCpLQuB8RMKYsm',
      nickname: 'plan mensuel basique',
      amount: @amount * 100
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

  def activate_school_status
    if self.plan.nil? == false && self.customer.nil? == false && self.subscription.nil? == false
      @current_admin.school.update(active: true)
    end
  end

end
