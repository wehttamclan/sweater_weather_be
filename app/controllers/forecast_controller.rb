class ForecastController < ApplicationController
  def show

  end
  
  private
  def location_params
    params.permit(:city, :state, :zip_code)
  end
end