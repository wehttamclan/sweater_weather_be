class DailyForecast
  include ActiveModel::Serialization
  attr_reader :summary, :icon

  def initialize(daily_forecast)
    @daily_forecast = daily_forecast
    @summary        = daily_forecast[:summary]
    @icon           = daily_forecast[:icon]
  end

  def days
    daily_forecast[:data].map { |daily_data| Day.new(daily_data) }
  end

  private
  attr_reader :daily_forecast
end