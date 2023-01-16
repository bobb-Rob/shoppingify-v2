class ApiController < ApplicationController
  before_action :doorkeeper_authorize!

  # Set response format to JSON
  respond_to :json

  # Set current user from doorkeeper token
  def current_user
    return unless doorkeeper_token

    @current_user ||= User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
  end
end
