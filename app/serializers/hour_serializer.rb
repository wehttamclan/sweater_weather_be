class HourSerializer < ActiveModel::Serializer
  attributes :time,
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

  def time
    Time.at(object.time).strftime('%l %p').lstrip
  end
end