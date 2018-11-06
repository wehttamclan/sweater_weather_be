class GoogleGeocoderService
  def initialize(location_data={})
    @input_city = location_data[:city]
    @input_state = location_data[:state]
    @input_zip_code = location_data[:zip_code]
  end

  def coordinates
    coords = get_json[:results].first[:geometry][:location]
    "#{coords[:lat]},#{coords[:lng]}"
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

  private
  attr_reader :input_city, :input_state, :input_zip_code
  
  def get_address_compenent(type)
    address_components.each do |component|
      return component[:short_name] if component[:types].include?(type)
    end
  end

  def address_components
    get_json[:results].first[:address_components]
  end

  def get_json
    JSON.parse(response.body, symbolize_names: true)
  end

  def location
    "+#{input_city},+#{input_state},+#{input_zip_code}"
  end

  def params
    { address: location,
      key: ENV['google_geocoder_api_key']
    }
  end

  def response
    conn.get("/maps/api/geocode/json", params)
  end

  def conn
    Faraday.new(url: 'https://maps.googleapis.com')
  end
end