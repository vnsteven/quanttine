class User < ApplicationRecord
	has_one :profile, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  before_create :school_exists
  after_create :create_profile

	validates :first_name, :last_name,
  presence: true,
	length: { in: 2..50 },
	format: { without: /[!@#%*+;,?&()=0123456789]/}

  private

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

  def create_profile
    @school = School.find_by(school_code: self.school_code)
    self.profile = Profile.create!(user_id: self.id, school_id: @school.id  )
  end

  def school_exists
     if current_user.params[:school_code] != School.last.school_code && current_user.params[:school_code] != School.first.school_code
       errors.add(:school_code, "est incorrect")
     end
  end

end
