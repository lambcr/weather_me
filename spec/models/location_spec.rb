require 'rails_helper'

describe Location, :vcr do
  subject { Location.new }

  it { should have_valid(:address).when('St. Petersburg, FL') }
  it { should_not have_valid(:address).when(nil) }
end
