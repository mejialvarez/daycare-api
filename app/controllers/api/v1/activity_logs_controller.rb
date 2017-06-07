class Api::V1::ActivityLogsController < ApplicationController

  def index
    render json: ActivityLog.includes(:baby, :assistant).for_baby(params[:baby_id])
  end
end