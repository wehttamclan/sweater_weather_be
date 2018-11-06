class Hour
  include ActiveModel::Serialization
  attr_reader :time, 
              :summary, 
              :icon, 
              :temperature, 
              :apparent_temperature, 
              :precip_probability, 
              :humidity, 
              :wind_speed, 
              :wind_gust, 
              :wind_bearing, 
              :uv_index, 
              :visibility
              
  def initialize(hourly_data)
    @hourly_data = hourly_data
    @time = hourly_data[:time]
    @summary = hourly_data[:summary]
    @icon = hourly_data[:icon]
    @temperature = hourly_data[:temperature]
    @apparent_temperature = hourly_data[:apparentTemperature]
    @precip_probability = hourly_data[:precipProbability]
    @humidity = hourly_data[:humidity]
    @wind_speed = hourly_data[:windSpeed]
    @wind_gust = hourly_data[:windGust]
    @wind_bearing = hourly_data[:windBearing]
    @uv_index = hourly_data[:uvIndex]
    @visibility = hourly_data[:visibility]
  end
    
  private
  attr_reader :hourly_data
end