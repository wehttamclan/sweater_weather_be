class CurrentForecast
  include ActiveModel::Serialization
  attr_reader :time, 
              :summary, 
              :icon, 
              :temperature, 
              :apparent_temperature, 
              :humidity, 
              :wind_speed, 
              :wind_gust,
              :visibility,
              :uv_index

  def initialize(current_forecast)
    @current_forecast = current_forecast
    @time = current_forecast[:time]
    @summary = current_forecast[:summary]
    @icon = current_forecast[:icon]
    @temperature = current_forecast[:temperature]
    @apparent_temperature = current_forecast[:apparentTemperature]
    @humidity = current_forecast[:humidity]
    @wind_speed = current_forecast[:windSpeed]
    @wind_gust = current_forecast[:windGust]
    @visibility = current_forecast[:visibility]
    @uv_index = current_forecast[:uvIndex]
  end

  private
  attr_reader :current_forecast
end