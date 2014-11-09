class ForecastPresenter
  attr_reader :forecast_response

  def initialize(forecast_response)
    @forecast_response = forecast_response
  end

  def simple
    @simple ||= build_simple_forecast
  end

  private

  def build_simple_forecast
    forecast_response.simpleforecast.forecastday.map do |daily_forecast|
      Hashie::Mash.new(
        conditions: daily_forecast.conditions,
        date:       Time.at(daily_forecast.date.epoch.to_i).to_date,
        low:        daily_forecast.low.fahrenheit,
        high:       daily_forecast.high.fahrenheit,
      )
    end
  end
end
