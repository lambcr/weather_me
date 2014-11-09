require 'rails_helper'

RSpec.describe "alert_schedules/index", type: :view, vcr: true do
  let!(:alert_schedules) {
    [
      FactoryGirl.create(:alert_schedule),
      FactoryGirl.create(:alert_schedule),
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
