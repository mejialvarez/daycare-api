class Api::V1::ActivityLogsController < Api::V1::ApiController
  def index
    render json: ActivityLog.includes(:baby, :assistant).for_baby(params[:baby_id])
  end

  def create
    activity_log = ActivityLog.new(activity_log_params)

    if activity_log.save
      render json: activity_log, status: :created
    else
      render json: { errors: activity_log.errors }, status: :unprocessable_entity
    end
  end

  def finish
    activity_log = ActivityLog.find(params[:id])

    if activity_log.finish(params[:activity_log][:stop_time], params[:activity_log][:comments])
      render json: activity_log, status: :ok
    else
      render json: { errors: activity_log.errors }, status: :unprocessable_entity
    end
  end

  private
    def activity_log_params
      params.require(:activity_log).permit(:baby_id, :assistant_id,
        :activity_id, :start_time)
    end
end