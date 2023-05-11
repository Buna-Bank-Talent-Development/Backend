class UserMailer < ApplicationMailer
    default from: Rails.application.config.action_mailer.smtp_settings[:user_name]

    def send_otp(employee)
        @employee = employee
        mail(to: @employee.email, subject: 'Your OTP code')
    end    

end
