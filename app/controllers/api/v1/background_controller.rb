class Api::V1::BackgroundController < ApplicationController
  def show
    render json: Background.new(location_params)
  end
  
  private
  def location_params
    params.permit(:city, :state, :zip_code)
  end
end
