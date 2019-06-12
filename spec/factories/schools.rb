FactoryBot.define do
  factory :school do
    name { Faker::Name.name }    
    city { Faker::Address.city }    
    street_address { Faker::Address.street_address }    
    zipcode { Faker::Address.zip_code }    
  end
end
