class Day
  include ActiveModel::Serialization
  attr_reader :time, 
              :summary, 
              :icon, 
              :sunrise_time, 
              :sunset_time, 
              :moon_phase, 
              :precip_probability, 
              :precip_type, 
              :temperature_high, 
              :temperature_low, 
              :wind_speed, 
              :wind_gust, 
              :wind_bearing
              
  def initialize(daily_data)
    @daily_data = daily_data
    @time  = daily_data[:time]
    @summary  = daily_data[:summary]
    @icon  = daily_data[:icon]
    @sunrise_time  = daily_data[:sunriseTime]
    @sunset_time  = daily_data[:sunsetTime]
    @moon_phase  = daily_data[:moonPhase]
    @precip_probability  = daily_data[:precipProbability]
    @precip_type  = daily_data[:precipType]
    @temperature_high  = daily_data[:temperatureHigh]
    @temperature_low  = daily_data[:temperatureLow]
    @wind_speed  = daily_data[:windSpeed]
    @wind_gust  = daily_data[:windGust]
    @wind_bearing = daily_data[:windBearing]
  end
    
  private
  attr_reader :daily_data
end