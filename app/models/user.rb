class User < ApplicationRecord
	has_one :profile, dependent: :destroy
  has_one_attached :avatar
	after_create :welcome_send, :create_profile
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  private

  def create_profile
    Profile.create!(user_id: self.id)
  end

  def welcome_send
  	UserMailer.welcome_email(self).deliver_now
  end

end
