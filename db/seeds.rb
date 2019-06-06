# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Profile.destroy_all
School.destroy_all
Admin.destroy_all
Preference.destroy_all

2.times do
  School.create!(
  )
end

5.times do
  Admin.create!(
    email: Faker::Internet.email,
    password: "password",
    school_id: School.all.sample.id
  )
end

10.times do
  user = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "password",
  )
  Profile.create!(
    user_id: user.id,
    school_id: School.all.sample.id
  )
end

# 20.times do
#   Preference.create!(
#     name: Faker::Food.fruits,
#     category: ["diet", "allergy"].sample
#   )
# end

4.times do 
  Preference.create!(
  name: ["Je ne mange pas de viande", "Je ne mange pas de produits laitiers", "Je ne mange pas de porc", "Je ne mange pas de produits marins"].sample,
  category: ["diet", "allergy"].sample
)
end


20.times do
  JoinTableProfilePreference.create!(
    profile_id: Profile.all.sample.id,
    preference_id: Preference.all.sample.id
  )
end
