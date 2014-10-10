require 'rails_helper'

describe AlertSchedule, :vcr do
  subject { AlertSchedule.new }

  it { should have_valid(:address).when('St. Petersburg, FL') }
  it { should_not have_valid(:address).when(nil) }
end
