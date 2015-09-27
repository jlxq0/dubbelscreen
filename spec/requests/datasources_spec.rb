require 'rails_helper'

RSpec.describe "Datasources", type: :request do
  describe "GET /datasources" do
    it "works! (now write some real specs)" do
      get datasources_path
      expect(response).to have_http_status(200)
    end
  end
end
