class HourlyForecastSerializer < ActiveModel::Serializer
  attributes :summary, :icon, :data

  def data
    object.hours.map do |hour|
      HourSerializer.new(hour)
    end
  end
end
