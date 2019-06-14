class Admin < ApplicationRecord
  belongs_to :school
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  after_create :send_welcome_email

  private

  def send_welcome_email
    AdminMailer.welcome_email(self).deliver_now
  end

end
