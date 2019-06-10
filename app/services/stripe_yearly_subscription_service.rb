class StripeYearlySubscriptionService
attr_accessor :customer, :subscription, :amount, :stripe_customer_id

  def initialize(params, amount, current_admin)
    @params = params
    @stripe_email = params[:stripeEmail]
    @stripe_token = params[:stripeToken]
    @amount = amount
    @current_admin = current_admin
    @school = current_admin.school
    @stripe_customer_id = current_admin.school.stripe_customer_id
  end

  def perform
    retrieve_customer
    create_subscription
    update_payment_information
  end

  def retrieve_customer
    if @stripe_customer_id.nil?
      @customer = Stripe::Customer.create({
        email: @stripe_email,
        source: @stripe_token
        })
    else
      @customer = Stripe::Customer.retrieve(
        @stripe_customer_id
      )
    end
  end

  def create_subscription
        @subscription = @customer.subscriptions.create(
          plan: 'plan_FE0oYwqfIjoLUc'
        )
  end

  def unsubscribe
      @school.update(
        active: true,
        stripe_customer_id: @customer.id,
        stripe_subscription_id: @subscription.id,
        stripe_plan_id: 'plan_FE0oYwqfIjoLUc'
        )
  end

  def delete_subscription
    retrieve_customer
    @customer.subscriptions.first.delete
    @school.update(
      active: false,
      stripe_subscription_id: "cancelled susbscription : #{DateTime.now}"
    )
  end

end
