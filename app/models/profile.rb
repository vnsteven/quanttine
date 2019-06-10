class Profile < ApplicationRecord
  belongs_to :user
  belongs_to :school, optional: true
  has_many :join_table_profile_preferences, dependent: :destroy
  has_many :preferences, through: :join_table_profile_preferences
  has_many :user_meals, dependent: :destroy
  has_one_attached :avatar
  after_create :attach_qr_code
  before_destroy :delete_attached_qr_code
  has_one_attached :qr_code

  def resized_avatar
    return self.avatar.variant(resize: '200x200!').processed
  end

  private

  def attach_qr_code
    QrCodeService.new(self).perform
  end

  def delete_attached_qr_code
    path_to_file = "app/assets/images/qr_codes/#{self.id}.svg"
    File.delete(path_to_file) if File.exist?(path_to_file)
  end

end
