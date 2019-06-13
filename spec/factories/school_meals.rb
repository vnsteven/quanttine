FactoryBot.define do
  factory :school_meal do
    date { Date.tomorrow }
    school { FactoryBot.create(:school) }
  end
end
