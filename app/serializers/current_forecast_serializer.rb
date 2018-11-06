class CurrentForecastSerializer < ActiveModel::Serializer
  attributes :time, 
             :summary, 
             :icon, 
             :temperature, 
             :apparent_temperature, 
             :humidity, 
             :wind_speed, 
             :wind_gust,
             :wind_bearing,
             :visibility,
             :uv_index


  def time
    Time.at(object.time).strftime('%b %e, %l:%M %p')
  end
end
