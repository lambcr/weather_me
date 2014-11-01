class GrabForecastForAlertSchedule
  def initialize(alert_schedule_id:)
    @alert_schedule_id = alert_schedule_id
  end

  def execute
    WeatherAlert::Wunderground.new('FL', 'Saint_Petersburg', api_key).forecast
  end

  def alert_schedule
    @alert_schedule ||= AlertSchedule.find(alert_schedule_id)
  end

  private

  def api_key
    Rails.configuration.wunderground.api_key
  end
end
