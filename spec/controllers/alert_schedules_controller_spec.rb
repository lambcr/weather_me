require 'rails_helper'

RSpec.describe AlertSchedulesController, type: :controller do
  let(:user) { FactoryGirl.create(:user) }
  before do
    sign_in(user)
  end

  describe "GET index", :vcr do
    let!(:alert_schedule) { FactoryGirl.create(:alert_schedule, creator: user) }
    before { get :index }

    it "succeeds" do
      expect(response).to be_success
    end
    it "returns the alert schedules" do
      expect(assigns(:alert_schedules)).to match_array([alert_schedule])
    end
  end

  describe "GET show", :vcr do
    let!(:alert_schedule) { FactoryGirl.create(:alert_schedule) }
    before do
      get :show, {id: alert_schedule.to_param}
    end

    it "succeeds" do
      expect(response).to be_success
    end
    it "returns the alert_schedule" do
      expect(assigns(:alert_schedule)).to eq(alert_schedule)
    end
  end

  describe "GET new" do
    before { get :new }

    it "succeeds" do
      expect(response).to be_success
    end
    it "returns a new alert schedule" do
      expect(assigns(:alert_schedule)).to be_a_new(AlertSchedule)
    end
  end

  describe "POST create", :vcr do
    describe "with valid params" do
      let(:valid_attributes) { {address: 'Saint Petersburg, FL'} }
      before do
        post :create, {alert_schedule: valid_attributes}
      end

      it "succeeds" do
        expect(response).to redirect_to(alert_schedule_url(assigns(:alert_creator).alert_schedule) )
      end
      it "creates a new AlertSchedule" do
        expect(AlertSchedule.count).to eq(1)
      end
    end
  end

  describe "GET forecast" do
    let(:alert_schedule_id) { 42 }

    let(:simple_forecast) { [Hashie::Mash.new(conditions: 'rainy', date: Date.today, high: '100', low: '42')] }
    let(:forecast_presenter) do
      double(simple: simple_forecast)
    end

    before do
      allow(GrabForecastForAlertSchedule).to receive(:new).and_return(double(execute: 'test'))
      allow(ForecastPresenter).to receive(:new).and_return(forecast_presenter)
      get :forecast, id: alert_schedule_id
    end

    context "with a successful forecast response" do
      it "succeeds" do
        expect(response).to be_success
      end
      it "returns the forecast" do
        expect(assigns(:forecast)).to eq(simple_forecast)
      end
      it "grabs the forecast for the alert schedule" do
        expect(GrabForecastForAlertSchedule).to have_received(:new)
      end
      it "presents the simple forecast" do
        expect(forecast_presenter).to have_received(:simple)
      end
    end
  end
end
