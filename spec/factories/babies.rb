FactoryGirl.define do
  factory :baby do
    name { Faker::Name.name }
    birthday { Faker::Date.birthday(1, 5) }
    mother_name { Faker::Name.name }
    father_name { Faker::Name.name }
    phone { Faker::PhoneNumber.phone_number }
  end
end
