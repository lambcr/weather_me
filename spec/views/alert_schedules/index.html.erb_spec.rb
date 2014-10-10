require 'rails_helper'

RSpec.describe "alert_schedules/index", type: :view do
  let!(:alert_schedules) {
    [
      AlertSchedule.new(
        name:       'test',
        created_by: 1,
        address: 'Florida',
      ),
      AlertSchedule.new(
        name:       'test',
        created_by: 1,
        address: 'Florida',
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
