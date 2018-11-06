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
    darksky_service
  end

  private
  def get_address_compenent(type)
    geocode_service.address_components.each do |component|
      return component[:short_name] if component[:types].include?(type)
    end
  end

  def geocode_service
    @service ||= GoogleGeocoderService.new(@location_data)
  end

  def darksky_service
    @service ||= DarkskyService.new(geocode_service.coordinates)
  end
end