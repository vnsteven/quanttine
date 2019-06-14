class JoinTableProfilePreference < ApplicationRecord
  belongs_to :profile
  belongs_to :preference, optional: true

  after_create :add_preference

  private

  def add_preference
  	@pref = Preference.all.sample
  	if JoinTableProfilePreference.where(profile_id: self.profile_id).find_by(preference_id: @pref.id) == nil
  		self.update!(preference_id: @pref.id)
  	else 
  		self.destroy
  	end
  end
end
