class StripeChargesService
  DEFAULT_CURRENCY = 'eur'.freeze

  def initialize(params, user)
    @stripe_email = params[:stripeEmail]
    @stripe_token = params[:stripeToken]
    @order = params[:order_id]
    @current_admin = current_admin
  end

  def perform
    create_charge(find_customer)
  end

  private

  attr_accessor :current_admin, :stripe_email, :stripe_token, :order

  def find_customer
    if current_admin.school.stripe_token
      retrieve_custommer(current_admin.school.stripe_token)
    else
      create_customer
    end
  end

  def retrieve_custommer(stripe_token)
    Stripe::Customer.retrieve(stripe_token)
  end

  def create_customer
    customer = Stripe::Customer.create(
      email: stripe_email,
      source: stripe_token
    )
    current_admin.school.update(stripe_customer_id: customer.id)
    customer
  end

  def create_charge(customer)
    Stripe::Charge.create(
      customer: customer.id,
      amount: @amount,
      description: current_admin.email,
      current: DEFAULT_CURRENCY
    )
  end
end
