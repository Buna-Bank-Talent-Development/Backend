# frozen_string_literal: true

class ApplicationController < ActionController::API
    before_action :authenticate_user

    private

    def authenticate_user
        auth_header = request.headers['Authorization']
        if auth_header.present?
        token = auth_header.split.last
        decoded_token = TokenService.decode(token)
        @current_user = User.find(decoded_token['user_id'])
        else
        render json: { error: 'Missing or invalid Authorization header' }, status: :unauthorized
        end
    rescue JWT::DecodeError
        render json: { error: 'Invalid JWT token' }, status: :unauthorized
    end

end
