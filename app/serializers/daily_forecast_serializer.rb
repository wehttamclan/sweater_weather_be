class DailyForecastSerializer < ActiveModel::Serializer
  attributes :summary, :icon, :data

  def data
    object.days.map do |day|
      DaySerializer.new(day)
    end
  end
end