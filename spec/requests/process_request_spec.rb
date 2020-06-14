require 'rails_helper'

RSpec.describe "Processes", type_transaction: :request do

  describe "GET /home" do
    it "returns http success" do
      get "/process/home"
      expect(response).to have_http_status(:success)
    end
  end

end
