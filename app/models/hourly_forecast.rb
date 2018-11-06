class HourlyForecast
  include ActiveModel::Serialization
  attr_reader :summary, :icon
  
  def initialize(hourly_forecast)
    @hourly_forecast = hourly_forecast
    @summary         = hourly_forecast[:summary]
    @icon            = hourly_forecast[:icon]
  end

  def hours
    hourly_forecast[:data].map { |hourly_data| Hour.new(hourly_data) }
  end

  private
  attr_reader :hourly_forecast
end