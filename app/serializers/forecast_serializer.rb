class ForecastSerializer < ActiveModel::Serializer
  attributes :city, :state, :country, :daily

  def daily
    DailyForecastSerializer.new(object.daily)
  end
end
