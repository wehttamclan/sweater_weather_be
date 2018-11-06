class Background
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

  private
  def geocode_service
    @geocode_service ||= GoogleGeocoderService.new(@location_data)
  end

  def darksky_service
    @darksky_service ||= DarkskyService.new(geocode_service.coordinates)
  end
end