module Api
  module V1    
    class UsersController < ApiController
      before_action :current_user

      def current
        if current_user.nil?
          render json: { error: 'Not authorized' }, status: :unauthorized
        else
          render json: {
            id: current_user.id,
            email: current_user.email,
            first_name: current_user.first_name,
            last_name: current_user.last_name,
            role: current_user.role,
            created_at: current_user.created_at.iso8601
          }, status: :ok
        end
      end
    end
  end
end
