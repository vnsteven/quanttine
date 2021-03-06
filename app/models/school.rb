class School < ApplicationRecord
  has_many :admins, dependent: :destroy
  has_many :profiles, dependent: :destroy # actually, we won't destroy any profiles or schools. We'll just deactive both of these entries in their respective tables
  has_many :quantities, dependent: :destroy
  has_many :food_supplies, through: :quantities
  has_many :school_meals, dependent: :destroy
  has_many :daily_services, dependent: :destroy
  after_update :send_payment_information_email

  validates :name,
  presence: true,
  length: { in: 2..100 }

  validates :city,
  presence: true,
  length: { in: 2..50 },
	format: { without: /[!@#%*+;,?&()=0123456789]/}

  validates :street_address,
  presence: true,
  length: { in: 2..100 }

  validates :zipcode,
  presence: true,
  length: { in: 2..50 }

  private

  def send_payment_information_email
    if self.active? && self.stripe_plan_id == "plan_FE0p7PlgEgQI9W"
      AdminMailer.subscription_month_email(self.admins.last).deliver_now
    elsif self.active? && self.stripe_plan_id == "plan_FE0oYwqfIjoLUc"
      AdminMailer.subscription_year_email(self.admins.last).deliver_now
    elsif self.active? == false
      AdminMailer.unsubscription_email(self.admins.last).deliver_now
    end
  end

end
