class AlertSchedulesController < ApplicationController
  before_action :set_alert_schedule, only: [:show]

  def index
    @alert_schedules = current_user.alert_schedules
  end

  def show
  end

  def new
    @alert_schedule = AlertSchedule.new
  end

  def create
    @alert_creator = CreateWeatherAlert.new(alert_schedule_params.merge(creator: current_user))

    if @alert_creator.execute
      redirect_to @alert_creator.alert_schedule, notice: 'Alert schedule was successfully created.'
    else
      render :new
    end
  end

  private

  def set_alert_schedule
    @alert_schedule = AlertSchedule.find(params[:id])
  end

  def alert_schedule_params
    params.require(:alert_schedule).permit(:name, :address)
  end
end
