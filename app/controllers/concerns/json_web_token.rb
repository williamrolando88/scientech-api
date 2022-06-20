require 'jwt'
module JsonWebToken
  extend ActiveSupport::Concern
  SECRET_KEY = Rails.application.credentials.secret_key_base

  def jwt_encode(payload, exp = Time.zone.now + 1.day)
    payload[:exp] = exp.to_i
    JWT.encode(payload, SECRET_KEY)
  end

  def jwt_decode(token)
    decoded = JWT.decode(token, SECRET_KEY)[0]
    HashWithIndifferentAccess.new decoded
  end
end