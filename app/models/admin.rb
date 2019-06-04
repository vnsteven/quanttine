class Admin < ApplicationRecord
  after_create :welcome_admin_send
  belongs_to :school
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def welcome_admin_send
  	AdminMailer.welcome_admin_email(self).deliver_now
  end
end
