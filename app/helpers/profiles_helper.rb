module ProfilesHelper  
  def preferences_list(profile)
    if profile.preferences.empty? == false
      profile.preferences.map { |preference| preference.name.gsub("Je ne mange pas de ", "") }.join(", ").downcase.capitalize
    else
      "N'a pas encore renseigné ses préférences"
    end
  end
end
