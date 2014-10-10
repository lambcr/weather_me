require 'rails_helper'

RSpec.describe "alert_schedules/index", :type => :view do
  let(:location) { Location.new(address: 'Florida') }
  let!(:alert_schedules) {
    [
      AlertSchedule.new(
        name:       'test',
        created_by: 1,
        location:   location,
      ),
      AlertSchedule.new(
        name:       'test',
        created_by: 1,
        location:   location,
      ),
    ]
  }
  before(:each) do
    assign(:alert_schedules, alert_schedules)
    render
  end

  it "renders a list of alert_schedules" do
    alert_schedules.each do |schedule|
      expect(rendered).to match(/#{schedule.name}/)
    end
  end
end
