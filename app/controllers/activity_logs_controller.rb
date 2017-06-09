class ActivityLogsController < ApplicationController

  def index
    @babies = Baby.all
    @assistants  = Assistant.all

    @activity_logs = ActivityLog.includes(:baby, :assistant, :activity).order(created_at: :desc)
    @activity_logs = @activity_logs.for_baby(params[:baby]) if params[:baby].present?
    @activity_logs = @activity_logs.for_assistant(params[:assistant]) if params[:assistant].present?
    @activity_logs = @activity_logs.by_status(params[:status]) if params[:status].present?
  end
end