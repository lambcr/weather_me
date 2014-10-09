class CreateWeatherAlert
  def initialize(alert_params, location_params)
    @alert_params    = alert_params
    @location_params = location_params
  end

  def execute
    alert_schedule.save!
  end

  def alert_schedule
    @alert_schedule ||= AlertSchedule.new(@alert_params) do |alert|
      alert.location = location
    end
  end

  def location
    @location ||= Location.new(@location_params)
  end
end
