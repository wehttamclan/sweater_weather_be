class Forecast
  include ActiveModel::Serialization
  def initialize(location_data)
    @location_data = location_data
  end

  def city
    geocode_service.city
  end

  def state
    geocode_service.state
  end

  def country
    geocode_service.country
  end

  def daily
    DailyForecast.new(darksky_service.forecast[:daily])
  end

  def hourly
    HourlyForecast.new(darksky_service.forecast[:hourly])
  end

  def currently
    CurrentForecast.new(darksky_service.forecast[:currently])
  end

  private
  def geocode_service
    @geocode_service ||= GoogleGeocoderService.new(@location_data)
  end

  def darksky_service
    @darksky_service ||= DarkskyService.new(geocode_service.coordinates)
  end
end