require 'rails_helper'

RSpec.describe AlertSchedulesController, type: :controller do
  let(:user) { User.create!(email: 'bender@gmail.com', password: 'testtest') }
  before do
    sign_in(user)
  end

  describe "GET index", :vcr do
    let!(:alert_schedule) { AlertSchedule.create!(address: 'Saint Petersburg, FL') }
    before { get :index }

    it "succeeds" do
      expect(response).to be_success
    end
    it "returns the alert schedules" do
      expect(assigns(:alert_schedules)).to match_array([alert_schedule])
    end
  end

  describe "GET show", :vcr do
    let!(:alert_schedule) { AlertSchedule.create!(address: 'Saint Petersburg, FL') }
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
end
