require 'spec_helper'

describe GrabForecastForAlertSchedule, :vcr do
  let!(:alert_schedule) { FactoryGirl.create(:alert_schedule) }

  subject { GrabForecastForAlertSchedule.new(alert_schedule_id: alert_schedule.id) }

  describe "#execute" do
    let(:weather_api) { double(forecast: {}) }
    let(:api_key) { Rails.configuration.wunderground.api_key }

    before do
      allow(WeatherAlert::Wunderground).to receive(:new).and_return(weather_api)
      subject.execute
    end

    it "calls the weather api" do
      expect(WeatherAlert::Wunderground).to have_received(:new).with('FL', 'Saint_Petersburg', api_key)
    end
    it "returns the forecast" do
      expect(weather_api).to have_received(:forecast)
    end
  end
end
