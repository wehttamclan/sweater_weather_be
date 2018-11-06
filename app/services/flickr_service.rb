class FlickrService
  def initialize(coordinates)
    @lat, @lon = coordinates.split(',')
  end

  def urls
    get_json[:photos][:photo].map do |photo|
      photo[:url_o] if photo[:url_o]
    end.compact
  end

  private
  def get_json
    JSON.parse(response.body, symbolize_names: true)
  end

  def params
    { 
     method: 'flickr.photos.search',
     api_key: ENV['flickr_api_key'],
     tags: 'city,skyline',
     lat: @lat,
     lon: @lon,
     radius: '20',
     radius_units: 'mi',
     format: 'json',
     nojsoncallback: '1',
     sort: 'interestingness-desc',
     extras: 'url_o'
    }
  end

  def response
    conn.get("/services/rest/", params)
  end

  def conn
    Faraday.new(url: 'https://api.flickr.com')
  end
end