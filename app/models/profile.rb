class Profile < ApplicationRecord
  belongs_to :user
  belongs_to :school, optional: true
  has_many :join_table_profile_preferences, dependent: :destroy
  has_many :preferences, through: :join_table_profile_preferences
  has_many :user_meals, dependent: :destroy
  has_one_attached :avatar
  after_create :attach_qr_code

  def resized_avatar
    return self.avatar.variant(resize: '200x200!').processed
  end

  private

  def attach_qr_code
    QrCodeService.new(self.id).save_as_svg
    Profile.update(qr_code: "qr_codes/#{self.id}.svg")
  end

end
