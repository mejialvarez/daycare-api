class Api::V1::ActivitiesController < Api::V1::ApiController
  def index
    render json: Activity.all
  end
end