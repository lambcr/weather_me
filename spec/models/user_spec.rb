require 'rails_helper'

describe User do
  subject { FactoryGirl.build(:user) }

  it { should be_valid }
  it { should have_valid(:email).when('chris@example.com') }
end
