class StripeSubscriptionService
attr_accessor :customer, :subscription, :amount

  def initialize(params, amount, current_admin)
    @params = params
    @stripe_email = params[:stripeEmail]
    @stripe_token = params[:stripeToken]
    @amount = amount
    @current_admin = current_admin
  end

  def perform
    retrieve_customer
    create_subscription
    update_payment_information
  end

  def retrieve_customer
    if @current_admin.school.stripe_customer_id.nil?
      create_customer
    elseexit
      customer_id = @current_admin.school.stripe_customer_id
    @customer = Stripe::Customer.retrieve(customer_id)
    end
  end

  def create_customer
      @customer = Stripe::Customer.create({
        email: @stripe_email,
        source: @stripe_token
        })
  end

  def create_subscription
        @subscription = @customer.subscriptions.create(
          plan: 'plan_FDxpJdgrZDTHzm'
        )
  end

  def update_payment_information
      @current_admin.school.update(
        active: true,
        stripe_customer_id: @customer.id
        )
  end

  def delete_subscription
    retrieve_customer
    @customer.subscriptions.first.delete
  end

end
