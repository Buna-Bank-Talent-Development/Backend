class AuthController < ApplicationController

    skip_before_action :authenticate_employee
    
      def send_otp
        @employee = Employee.find_by(email: employee_params[:email])
        if @employee
          UserMailer.send_otp(@employee).deliver_later!
          render json: { message: 'OTP code sent' }
        else
          render json: { error: 'Employee not found' }, status: :not_found
        end
      end
    
      def verify_otp
        
        @employee = Employee.find_by(email: employee_params[:email])
        if @employee && @employee.authenticate_otp(employee_params[:otp_code], drift: 300)
          payload = { employee_id: @employee.id , name: @employee.full_name, email: @employee.email, role: @employee.role}
          token = TokenService.encode(payload)
          render json: { auth_token: token }
        else
          render json: { error: 'Invalid OTP code or user not found' }, status: :unauthorized
        end
      end
    
      private
        
      def employee_params
        params.require(:payload).permit(:email, :otp_code)
      end
end
