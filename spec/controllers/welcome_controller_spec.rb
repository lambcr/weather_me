require 'rails_helper'

describe WelcomeController do

  describe "GET 'home'" do
    let(:user) { FactoryGirl.create(:user) }
    before do
      sign_in(user)
      get 'home'
    end

    it "returns http success" do
      expect(response).to be_success
    end
  end

end
