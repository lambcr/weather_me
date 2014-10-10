require 'rails_helper'

RSpec.describe "alert_schedules/show", type: :view do
  let(:alert_schedule) {
    AlertSchedule.new(
      name:       'test',
      created_by: 1,
      address:    'Florida',
    )
  }
  before(:each) do
    assign(:alert_schedule, alert_schedule)
    render
  end

  it "renders the alert schedule name" do
    expect(rendered).to match(/#{alert_schedule.name}/)
  end
  it "renders the alert schedule location" do
    expect(rendered).to match(/#{alert_schedule.address}/)
  end
end
