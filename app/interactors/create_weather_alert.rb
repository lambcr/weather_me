class CreateWeatherAlert
  attr_reader :alert_params, :alert_schedule

  def initialize(alert_params)
    @alert_params    = alert_params
  end

  def execute
    @alert_schedule = AlertSchedule.create!(alert_params)
  end
end
