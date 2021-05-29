require 'rails_helper'

RSpec.describe "Rides", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/rides/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/rides/create"
      expect(response).to have_http_status(:success)
    end
  end

end
