# app/services/token_service.rb
class TokenService
    def self.encode(payload)
      secret_key = Rails.application.secrets.secret_key_base
      JWT.encode(payload, secret_key)
    end
  
    def self.decode(token)
      secret_key = Rails.application.secrets.secret_key_base
      decoded_token = JWT.decode(token, secret_key)
      decoded_token.first
    end
end
