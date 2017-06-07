class ActivityLogSerializer < ActiveModel::Serializer
  attributes :id, :baby_id, :assistant_name, :start_time, :stop_time

  def baby_id
    object.baby.id
  end

  def assistant_name
    object.assistant.name
  end

  def start_time
    object.start_time.to_time.iso8601
  end

  def stop_time
    object.stop_time.to_time.iso8601 if object.stop_time
  end
end