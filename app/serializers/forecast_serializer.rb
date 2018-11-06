class ForecastSerializer < ActiveModel::Serializer
  attributes :city, :state, :country, :currently, :hourly, :daily

  def daily
    DailyForecastSerializer.new(object.daily)
  end

  def hourly
    HourlyForecastSerializer.new(object.hourly)
  end

  def currently
    CurrentForecastSerializer.new(object.currently)
  end
end
