class GoogleGeocoderService
  def initialize(location_data={})
    @city = location_data[:city]
    @state = location_data[:state]
    @zip_code = location_data[:zip_code]
  end

  def coordinates
    coords = get_json[:results].first[:geometry][:location]
    "#{coords[:lat]},#{coords[:lng]}"
  end

  private
  attr_reader :city, :state, :zip_code
  
  def get_json
    JSON.parse(response.body, symbolize_names: true)
  end

  def location
    "+#{city},+#{state},+#{zip_code}"
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