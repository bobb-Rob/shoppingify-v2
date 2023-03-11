require 'rails_helper'

RSpec.describe "DefaultCategories", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/default_categories/index"
      expect(response).to have_http_status(:success)
    end
  end

end
