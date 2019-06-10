module ProfilesHelper  
  def preferences_list(profile)
    profile.preferences.map { |preference| preference.name }.join(", ").downcase.capitalize
  end
end
