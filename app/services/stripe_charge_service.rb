class StripeChargeService
  attr_accessor :customer, :charge, :current_admin

  def initialize(params, current_admin, amount)
    @stripe_email = params[:stripeEmail]
    @stripe_token = params[:stripeToken]
    @current_admin = current_admin
    @amount = amount
    @customer = nil
    @charge = nil
  end

  def perform
    create_customer
    create_charge
  end

  def create_customer
    @customer = Stripe::Customer.create({
      email: @stripe_email,
      source: @stripe_token,
      description: 'Payment annuel',
    })
    @current_admin.school.update(stripe_customer_id: @customer.id)
  end

  def create_charge
    @charge = Stripe::Charge.create(
      customer: @customer.id,
      amount: @amount * 100,
      description: @current_admin.email,
      currency: 'eur'
    )
  end

end