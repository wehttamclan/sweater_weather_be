class DaySerializer < ActiveModel::Serializer
  attributes :time, :summary, :icon, :sunrise_time, :sunset_time, :moon_phase, :precip_probability, :precip_type, :temperature_high, :temperature_low

  def time
    Time.at(object.time).strftime('%A, %b %d')
  end

  def sunrise_time
    Time.at(object.sunrise_time).strftime('%I:%M:%S %p')
  end

  def sunset_time
    Time.at(object.sunset_time).strftime('%I:%M:%S %p')
  end

end

