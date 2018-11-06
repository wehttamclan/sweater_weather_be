class Forecast
  include ActiveModel::Serialization
  def initialize(location_data)
    @location_data = location_data
  end

  def city
    get_address_compenent('locality')
  end

  def state
    get_address_compenent('administrative_area_level_1')
  end

  def country
    get_address_compenent('country')
  end

  def daily
    DailyForecast.new(darksky_service.forecast[:daily])
  end

  private
  def get_address_compenent(type)
    geocode_service.address_components.each do |component|
      return component[:short_name] if component[:types].include?(type)
    end
  end

  def geocode_service
    @geocode_service ||= GoogleGeocoderService.new(@location_data)
  end

  def darksky_service
    @darksky_service ||= DarkskyService.new(geocode_service.coordinates)
  end
end