class Baby < ApplicationRecord
  has_many :activity_logs

  def to_s
    name.humanize
  end
end
