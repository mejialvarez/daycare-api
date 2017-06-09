class AddStatusToActivityLogs < ActiveRecord::Migration[5.1]
  def change
    add_column :activity_logs, :status, :integer, default: 0
  end
end
