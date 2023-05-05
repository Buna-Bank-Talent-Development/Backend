class UserMailer < ApplicationMailer
    default from: Rails.application.config.action_mailer.smtp_settings[:user_name]

    def send_otp(user)
        @user = user
        mail(to: @user.email, subject: 'Your OTP code')
    end    

end
