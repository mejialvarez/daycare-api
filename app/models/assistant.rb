class Assistant < ApplicationRecord
  has_many :activity_logs

  def to_s
    name.humanize
  end
end
