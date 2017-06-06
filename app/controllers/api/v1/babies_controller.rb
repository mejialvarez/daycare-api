class Api::V1::BabiesController < ApplicationController

  def index
    render json: Baby.all
  end
end