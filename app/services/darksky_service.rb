class DarkskyService
  def initialize(coordinates)
    @coordinates = coordinates
  end


  def forecast
    JSON.parse(response.body, symbolize_names: true)
  end
  
  private
  def response
    conn.get("/forecast/#{ENV['dark_sky_api_key']}/#{@coordinates}")
  end

  def conn
    Faraday.new(url: 'https://api.darksky.net')
  end
end