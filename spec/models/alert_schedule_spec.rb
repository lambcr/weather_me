require 'rails_helper'

describe AlertSchedule do
  subject { AlertSchedule.new }

  it { should have_valid(:location).when(Location.new(address: 'Tampa, FL')) }
  it { should_not have_valid(:location).when(nil) }

end
