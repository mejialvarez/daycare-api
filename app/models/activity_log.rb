class ActivityLog < ApplicationRecord
  belongs_to :baby
  belongs_to :assistant
  belongs_to :activity

  scope :for_baby, ->(baby_id) { where("baby_id = ?", baby_id) }

  validates :start_time, datetime: true
  validates :stop_time, datetime: true, if: :stop_time?

  define_model_callbacks :finish, only: [:before, :after]
  after_finish :generate_duration

  def finish(stop_time, comments)
    run_callbacks :finish do
      update(stop_time: stop_time, comments: comments)
    end
  end

  private
    def generate_duration
      duration_in_minutes = ((stop_time - start_time)/1.minutes).round
      update(duration: duration_in_minutes)
    end
end
