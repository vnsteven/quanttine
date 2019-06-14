# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'i18n'

User.destroy_all
Profile.destroy_all
School.destroy_all
Admin.destroy_all
Preference.destroy_all
FoodSupply.destroy_all

supplies = ["Oeufs mayonnaise","Salade de maïs","Tomate mozzarella","Salade d'endives","Concombres","Friand au fromage","Céleri rémoulade","Carottes rapées","Taboulé","Salade piémontaise","Salade de pommes de terre","Quiche lorraine","Poireaux vinaigrette","Salade composée","Saucisson","Betteraves","Pâté de campagne","Steak haché","Saumon en papillote","Lapin à la moutarde","Boeuf bourgignon","Omelette au fromage", "Boeuf aux oignons","Rôti de boeuf", "Boeuf wellington", "Tartare de boeuf", "Chili con carne","Boulettes de boeuf", "Sauté de porc","Rôti de porc","Côte de porc","Porc au caramel","Filet mignon","Colombo de porc","Poitrine de porc","Blanquette de veau","Jarret de veau","Sauté de veau","Côte de veau","Veau marengo","Paupiettes de veau","Rôti de veau","Boulettes de veau","Tajine de veau","Escalope de veau","Couscous","Poulet basquaise","Poulet à l'estragon","Poulet coco","Poulet tandoori","Poulet frit","Tajine de poulet","Poulet rôti","Émincé de poulet","Poulet aux olives","Poulet aux amandes","Poulet au curry","Poulet teriyaki","Kebab de poulet","Poulet piri-piri","Saumon à l'oseille","Dos de cabillaud","Pavé de thon","Thon provençal","Poulet sauce satay","Riz","Riz cantonnais","Riz pilaf","Riz sauvage","Riz vapeur","Spaghettis","Coquillettes","Linguine","Gnocchis","Fusilli","Penne","Macaronis","Tagliatelles","Pommes de terre vapeur","Frites","Purée","Pommes paillasson","Pomme au four","Pommes de terre sautées","Röstis","Haricots verts","Carottes sautées","Carottes vapeur","Chou-fleur","Aubergines","Patate douce","Courgettes","Butternut","Haricot beurre","Petits pois","Lentilles","Blé","Boulghour","Pommes de terre façon Romain","Tarte aux fraises","Tarte à la rhubarbe","Tarte citron meringuée","Tarte aux pommes","Gâteau au chocolat","Quatre-quart","Clafoutis cerise","Cake au citron","Mille-feuille","Paris-Brest","Fôret noire","Éclair au chocolat","Éclair au café","Tarte tatin","Clafoutis aux pommes","Yaourt à la grecque","Yaourt","Camembert","Roquefort","Brie","Comté","Chèvre","Cantal","Emmental","Gouda","Maroilles","Tomme de savoie","Pomme","Poire","Raisins","Clémentine","Orange","Pêche","Abricot","Nectarines","Banane","Ananas","Cerises","Mandarine","Fraises"]


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

puts 'School done'

5.times do
  Admin.create!(
    email: Faker::Internet.email,
    password: "password",
    school_id: School.all.sample.id
  )
end

puts 'Admin done'

10.times do
  begin
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    email = "#{first_name.downcase}.#{last_name.downcase}@yopmail.com"
    transliterated_email = I18n.transliterate(email).gsub(' ','')
    User.create!(
      first_name: first_name,
      last_name: last_name,
      email: transliterated_email,
      password: "password",
      school_code: School.all.sample.school_code
    )
  rescue
    binding.pry
  end
end

puts 'User done'

preferences=["Je ne mange pas de viande", "Je ne mange pas de produits laitiers", "Je ne mange pas de porc", "Je ne mange pas de produits marins"]

a = 0
4.times do
  Preference.create!(
    name: preferences[a],
    category: ["diet", "allergy"].sample
  )
  a += 1
end

puts 'Preferences done'

20.times do
  JoinTableProfilePreference.create!(
    profile_id: Profile.all.sample.id,
    preference_id: Preference.all.sample.id
  )
end

puts "JoinTableProfilePreference done"

supplies.each do |supply|
  FoodSupply.create!(
    name: supply
  )
end

puts 'Food Supply done'

200.times do
  Quantity.create!(
    quantity: rand(1..1000),
    school_id: School.all.sample.id,
    food_supply_id: FoodSupply.all.sample.id
  )
end

puts 'Quantity done'

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

puts 'SchoolMeal done'

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

puts 'Serving done'

50.times do
  UserMeal.create!(
    profile_id: Profile.all.sample.id
  )
end

puts 'User Meal done'

100.times do
  PreparingUserMeal.create!(
    serving_size: rand(1..200),
    serving_id: Serving.all.sample.id,
    user_meal_id: UserMeal.all.sample.id
  )
end

puts 'Preparing User Meal done'

10.times do
  JoinTablePreferenceFood.create!(
    preference_id: Preference.all.sample.id,
    food_supply_id: FoodSupply.all.sample.id
  )
end

puts 'JoinTablePreferenceFood done'

# ok I know adding some kind of validations would be better
# but it's just a quick fix
# to have something presentable for the demo day
puts "Cleaning profile's preferences to make them uniq."
Profile.all.each do |profile|
  if profile.preference_ids.count > 1
    ids = profile.preference_ids.uniq
    profile.update(preference_ids: ids)
  end
end
