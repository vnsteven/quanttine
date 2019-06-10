class StripeYearlySubscriptionService
  attr_accessor :customer, :subscription, :stripe_customer_id, :params, :stripe_token

  def initialize(params, current_admin)
    @params = params
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
        email: @params[:stripeEmail],
        source: @params[:stripeToken]
        })
    else
        @customer = Stripe::Customer.retrieve(
          @stripe_customer_id
        )
    end
  end

    def create_subscription
      @subscription = @customer.subscriptions.create(
        plan: 'plan_FE0p7PlgEgQI9W'
      )
    end

    def update_payment_information
      @school.update(
        active: true,
        stripe_customer_id: @customer.id,
        stripe_subscription_id: @subscription.id,
        stripe_plan_id: 'plan_FE0p7PlgEgQI9W'
      )
    end

    def unsubscribe
      retrieve_customer
      @customer.subscriptions.first.delete
      @school.update(
        active: false,
        stripe_subscription_id: "cancelled susbscription : #{DateTime.now}",
      )
    end

end
