class ClientController < ApplicationController
  def index
    @react = Doorkeeper::Application.last
    render json: {
      name: @react.name,
      client_id: @react.uid,
      client_secret: @react.secret,
      created_at: @react.created_at
    }
  end
end
