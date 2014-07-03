require 'rails_helper'

describe User do
  subject { User.new }

  it { should have_valid(:email).when('chris@example.com') }
end
