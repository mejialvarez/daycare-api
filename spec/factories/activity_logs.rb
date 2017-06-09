FactoryGirl.define do
  factory :activity_log do
    baby
    activity
    assistant
    start_time { Faker::Time.backward(60, :morning) }
    stop_time { Faker::Time.forward(60, :morning) }
    comments { Faker::Lorem.characters(10) }

    factory :activity_log_invalid do
      start_time nil
      stop_time nil
    end
  end
end
