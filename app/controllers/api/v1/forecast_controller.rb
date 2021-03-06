class Api::V1::ForecastController < ApplicationController
  def show
    render json: Forecast.new(location_params)
  end
  
  private
  def location_params
    params.permit(:city, :state, :zip_code)
  end
end
