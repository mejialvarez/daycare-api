FactoryGirl.define do
  factory :activity do
    name { Faker::Name.name }
    description { Faker::Lorem.characters(100) }
  end
end
