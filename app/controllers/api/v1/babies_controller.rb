class Api::V1::BabiesController < Api::V1::ApiController

  def index
    render json: Baby.all
  end
end