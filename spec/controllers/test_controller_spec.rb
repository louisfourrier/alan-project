require 'rails_helper'

RSpec.describe TestController, type: :controller do

  describe "GET #first" do
    it "returns http success" do
      get :first
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #seconde" do
    it "returns http success" do
      get :seconde
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #third" do
    it "returns http success" do
      get :third
      expect(response).to have_http_status(:success)
    end
  end

end
