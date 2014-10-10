require 'rails_helper'

describe CreateWeatherAlert, :vcr do
  subject { described_class.new(alert_params) }
  let(:user) { FactoryGirl.create(:user) }
  let(:alert_params) { {name: 'New Alert', address: 'St. Petersburg, FL', creator: user} }

  describe "#execute" do
    context "with valid params" do
      let(:created_alert) { AlertSchedule.last }
      before { subject.execute }

      it "saves a new alert" do
        expect(AlertSchedule.count).to eq(1)
      end
      it "saves the name" do
        expect(created_alert.name).to eq('New Alert')
      end
      it "saves the address" do
        expect(created_alert.address).to eq('St. Petersburg, FL')
      end
      it "associates the user" do
        expect(created_alert.creator).to eq(user)
      end
    end
  end
end
