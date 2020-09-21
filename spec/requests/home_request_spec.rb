require 'rails_helper'

RSpec.describe "Homes", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/home/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /private" do
    it "returns http success" do
      get "/home/private"
      expect(response).to have_http_status(:success)
    end
  end

end
