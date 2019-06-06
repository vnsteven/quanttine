class ChargePaymentsController < ApplicationController
before_action :authenticate_admin!

  def new
    @amount = 5000
  end

  def create
    @amount = 5000

    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })

    Stripe::Charge.create({
      customer: customer.id,
      amount: @amount,
      description: 'Client Administrateur Quanttine',
      currency: 'eur',
    })
    current_admin.school.active = true
    current_admin.school.stripe_customer_id = customer.id
    current_admin.school.save
    byebug
    redirect_to admin_path(current_admin)


  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_payment_path
  end

end
