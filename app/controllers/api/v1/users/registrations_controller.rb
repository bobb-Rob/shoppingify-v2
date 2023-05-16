module Api
  module V1
    module Users
      class RegistrationsController < ApiController
        skip_before_action :doorkeeper_authorize!, only: :create
        include DoorkeeperRegisterable

        def create
          client_app = Doorkeeper::Application.find_by(uid: params[:client_id])
          unless client_app
            return render json: {
              error: I18n.t('doorkeeper.errors.messages.invalid_client')
            }, status: :unauthorized
          end

          allowed_params = user_params.except(:client_id)
          user = User.new(allowed_params)
          if user.save
            # render user including first_name, last_name
            render json: render_user(user, client_app), status: :created
          else
            render json: {
              error: user.errors.full_messages
            }, status: :unprocessable_entity
          end
        end

        private

        def render_user(user, client_app)
          access_token = Doorkeeper::AccessToken.create(
            resource_owner_id: user.id,
            application_id: client_app.id
          )
          refresh_token = Doorkeeper::AccessToken.create(
            resource_owner_id: user.id,
            application_id: client_app.id,
            use_refresh_token: true
          )

          {
            id: user.id,
            email: user.email,
            first_name: user.first_name,
            last_name: user.last_name,
            token_type: 'Bearer',
            access_token: access_token.token,
            refresh_token: refresh_token.token,
            created_at: access_token.created_at.to_i
          }
        end

        def user_params
          params.permit(:first_name, :last_name, :email, :password, :client_id)
        end
      end
    end
  end
end
