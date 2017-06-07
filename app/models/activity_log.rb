class ActivityLog < ApplicationRecord
  belongs_to :baby
  belongs_to :assistant
  belongs_to :activity

  scope :for_baby, ->(baby_id) { where("baby_id = ?", baby_id) }

  validates :start_time, datetime: true
  validates :stop_time, datetime: true, if: :stop_time?
end
