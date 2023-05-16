require 'rails_helper'

RSpec.describe 'DefaultItems', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/default_items/index'
      expect(response).to have_http_status(:success)
    end
  end
end
