require 'rails_helper'

describe CreateWeatherAlert, :vcr do
  subject { described_class.new(alert_params, location_params) }
  let(:alert_params) { {name: 'New Alert'} }
  let(:location_params) { {address: 'St. Petersburg, FL'} }

  describe "#execute" do
    context "with valid params" do
      before { subject.execute }

      it "saves a new alert" do
        expect(AlertSchedule.count).to eq(1)
      end
      it "saves a new location" do
        expect(Location.count).to eq(1)
      end
    end

    context "with invalid params" do

    end
  end


end
