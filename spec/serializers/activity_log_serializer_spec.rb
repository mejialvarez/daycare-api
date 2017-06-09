require 'rails_helper'

describe ActivityLogSerializer, type: :serializer do
  let :activity_log { create(:activity_log) }

  it "serialize attributes of an activity log" do
    activity_log_serialized = {
      id: activity_log.id,
      baby_id: activity_log.baby.id,
      assistant_name: activity_log.assistant.name,
      start_time: activity_log.start_time.to_time.iso8601,
      stop_time: activity_log.stop_time.to_time.iso8601,
      comments: activity_log.comments,
      duration: nil
    }

    expect(serialize(activity_log)).to eq activity_log_serialized
  end
end
