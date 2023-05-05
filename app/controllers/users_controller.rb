class UsersController < ApplicationController

    skip_before_action :authenticate_user
    
    def send_otp
        @user = User.find_by(email: user_params[:email])
        if @user
          UserMailer.send_otp(@user).deliver_later!
          render json: { message: 'OTP code sent' }
        else
          render json: { error: 'User not found' }, status: :not_found
        end
      end
    
      def verify_otp
        
        @user = User.find_by(email: user_params[:email])
        if @user && @user.authenticate_otp(user_params[:otp_code], drift: 60)
          # OTP code is valid, generate a JWT for the user using the TokenService.
          payload = { user_id: @user.id }
          token = TokenService.encode(payload)
          render json: { auth_token: token }
        else
          # OTP code is invalid or user not found, handle error.
          render json: { error: 'Invalid OTP code or user not found' }, status: :unauthorized
        end
      end
    
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
    
      def user_params
        params.require(:payload).permit(:email, :otp_code)
      end
end
