class ApiController < ApplicationController
  before_action :doorkeeper_authorize!, except: :get_client_credentials,

  # skip_before_action :verify_authenticity_token

  # Set response format to JSON
  respond_to :json

  # Set current user from doorkeeper token
  def current_user
    return unless doorkeeper_token

    @current_user ||= User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
  end

  def get_client_credentials
    @react = Doorkeeper::Application.last
    render_json: @react
  end


  # # Verify
  #   def verify_authenticity_token

  #   end
end
