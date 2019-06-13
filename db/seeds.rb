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
FoodSupply.destroy_all


2.times do
rand = rand(1000..2000)
  School.create!(
    name: "École #{Faker::Name.first_name} #{Faker::Name.last_name}",
    city: Faker::Address.city,
    street_address: Faker::Address.street_address,
    zipcode: Faker::Address.zip_code,
    school_code: "#{rand}"
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
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  User.create!(
    first_name: first_name,
    last_name: last_name,
    email: "#{first_name}.#{last_name}@yopmail.com".downcase,
    password: "password",
    school_code: School.all.sample.school_code
    )
end

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

100.times do
  FoodSupply.create!(
    name: Faker::Food.fruits
    )
end

200.times do
  Quantity.create!(
    quantity: rand(1..1000),
    school_id: School.all.sample.id,
    food_supply_id: FoodSupply.all.sample.id
    )
end

i = 1
50.times do
  School.all.each do |school|
    date = Date.today + i
    SchoolMeal.create!(
      date: date.strftime("%d/%m/%Y"),
      school_id: school.id
      )
  end
  i += 1
end

# We create servings (starter/main_course/dessert) for each schoolmeal (aka a daily menu for one school)
SchoolMeal.all.each do |schoolmeal|
  3.times do
    Serving.create!(
      meal_category: 1,
      food_supply_id: FoodSupply.all.sample.id,
      school_meal_id: schoolmeal.id
      )
    Serving.create!(
      meal_category: 2,
      food_supply_id: FoodSupply.all.sample.id,
      school_meal_id: schoolmeal.id
      )
    Serving.create!(
      meal_category: 3,
      food_supply_id: FoodSupply.all.sample.id,
      school_meal_id: schoolmeal.id
      )
    Serving.create!(
      meal_category: 4,
      food_supply_id: FoodSupply.all.sample.id,
      school_meal_id: schoolmeal.id
      )
  end
end



50.times do
  UserMeal.create!(
    profile_id: Profile.all.sample.id
    )
end

100.times do
  PreparingUserMeal.create!(
    serving_size: rand(1..200),
    serving_id: Serving.all.sample.id,
    user_meal_id: UserMeal.all.sample.id
    )
end

10.times do
  JoinTablePreferenceFood.create!(
    preference_id: Preference.all.sample.id,
    food_supply_id: FoodSupply.all.sample.id
    )
end
