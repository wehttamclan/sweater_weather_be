class Day
  include ActiveModel::Serialization
  def initialize(daily_data)
    @daily_data = daily_data
  end
    
  def time
    daily_data[:time]
  end

  def summary 
    daily_data[:summary]
  end

  def icon 
    daily_data[:icon]
  end

  def sunrise_time 
    daily_data[:sunriseTime]
  end

  def sunset_time 
    daily_data[:sunsetTime]
  end

  def moon_phase 
    daily_data[:moonPhase]
  end

  def precip_probability 
    daily_data[:precipProbability]
  end

  def precip_type 
    daily_data[:precipType]
  end

  def temperature_high 
    daily_data[:temperatureHigh]
  end

  def temperature_low 
    daily_data[:temperatureLow]
  end

  private
  attr_reader :daily_data
end