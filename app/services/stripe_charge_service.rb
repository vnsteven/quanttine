class StripeChargeService
  DEFAULT_CURRENCY = 'eur'.freeze
  attr_accessor :customer

  def initialize(params, current_admin, amount)
    @stripe_email = params[:stripeEmail]
    @stripe_token = params[:stripeToken]
    @order = params[:order_id]
    @current_admin = current_admin
    @amount = amount
    @customer = nil
  end

  def perform
    create_charge
  end

  def create_customer
    @customer = Stripe::Customer.create({
      email: @stripe_email,
      source: @stripe_token,
      description: 'Payment annuel',
    })
    @current_admin.school.update(stripe_customer_id: customer.id)
    customer
  end

  def create_charge
    Stripe::Charge.create(
      customer: @customer.id,
      amount: @amount * 100,
      description: @current_admin.email,
      currency: DEFAULT_CURRENCY
    )
  end

end
