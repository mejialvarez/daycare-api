FactoryGirl.define do
  factory :activity_log do
    baby { create(:baby) }
    assistant { create(:assistant) }
    activity { create(:activity) }
    start_time { Faker::Date.backward(50) }
    stop_time { Faker::Date.forward(100) }
    duration { Faker::Number.number(2) }
    comments { Faker::Lorem.characters(100) }
  end
end
