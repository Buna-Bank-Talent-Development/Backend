# frozen_string_literal: true

class ApplicationController < ActionController::API
    before_action :authenticate_employee

    private

    def authenticate_employee
        auth_header = request.headers['Authorization']
        if auth_header.present?
        token = auth_header.split.last
        decoded_token = TokenService.decode(token)
        @current_employee = Employee.find(decoded_token['employee_id'])
        else
        render json: { error: 'Missing or invalid Authorization header' }, status: :unauthorized
        end
    rescue JWT::DecodeError
        render json: { error: 'Invalid JWT token' }, status: :unauthorized
    end

end
