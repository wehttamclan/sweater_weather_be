class DaySerializer < ActiveModel::Serializer
  attributes :time,
             :summary,
             :icon,
             :sunrise_time,
             :sunset_time,
             :moon_phase,
             :wind_speed,
             :wind_gust,
             :wind_bearing,
             :precip_probability,
             :precip_type,
             :temperature_high,
             :temperature_low

  def time
    Time.at(object.time).strftime('%A, %b %d')
  end

  def sunrise_time
    Time.at(object.sunrise_time).strftime('%l:%M:%S %p').lstrip
  end

  def sunset_time
    Time.at(object.sunset_time).strftime('%l:%M:%S %p').lstrip
  end
end
