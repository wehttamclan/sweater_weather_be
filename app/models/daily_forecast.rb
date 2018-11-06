class DailyForecast
  include ActiveModel::Serialization
  def initialize(daily_forecast)
    @daily_forecast = daily_forecast
  end

  def summary
    daily_forecast[:summary]
  end

  def icon
    daily_forecast[:icon]
  end

  def days
    daily_forecast[:data].map { |daily_data| Day.new(daily_data) }
  end

  private
  attr_reader :daily_forecast
end