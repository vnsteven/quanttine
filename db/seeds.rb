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
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "password",
  )
  Profile.create!(
    user_id: User.all.sample.id,
    school_id: School.all.sample.id

  )
end
