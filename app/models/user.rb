class User < ApplicationRecord
	has_one :profile, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  after_create :create_profile, :welcome_send

	validates :first_name, :last_name,
  presence: true,
	length: { in: 2..50 }

  private

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

  # def school_exists
  #   if self.school_code != School.last.school_code && self.school_code != School.first.school_code
  #     errors.add(:school_code, "est incorrect")
  #   end
  # end

  def create_profile
    Profile.create!(user_id: self.id, school_id: School.all.sample.id )
  end

end
