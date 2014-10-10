require "rails_helper"

RSpec.describe AlertSchedulesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/alert_schedules").to route_to("alert_schedules#index")
    end

    it "routes to #new" do
      expect(:get => "/alert_schedules/new").to route_to("alert_schedules#new")
    end

    it "routes to #show" do
      expect(:get => "/alert_schedules/1").to route_to("alert_schedules#show", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/alert_schedules").to route_to("alert_schedules#create")
    end
  end
end
