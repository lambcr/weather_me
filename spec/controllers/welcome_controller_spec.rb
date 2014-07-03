require 'rails_helper'

describe WelcomeController do

  describe "GET 'home'" do
    before { get 'home' }

    it "returns http success" do
      expect(response).to be_success
    end
  end

end
