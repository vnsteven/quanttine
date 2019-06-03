class User < ApplicationRecord
	belongs_to :school, optional: true
	has_one :profile, dependent: :destroy
	after_create :welcome_send
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def welcome_send
  	UserMailer.welcome_email(self).deliver_now
  end
end
