FactoryGirl.define do
  factory :assistant do
    name { Faker::Name.name }
    group { Faker::Number.number(2) }
    address { Faker::Address.street_address }
    phone { Faker::PhoneNumber.phone_number }
  end
end
