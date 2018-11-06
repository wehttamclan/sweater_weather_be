class DailyForecastSerializer < ActiveModel::Serializer
  attributes :summary, :icon, :days

  def days
    object.days.map do |day|
      DaySerializer.new(day)
    end
  end
end
