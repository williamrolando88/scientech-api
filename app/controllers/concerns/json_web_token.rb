require 'jwt'
module JsonWebToken
  extend ActiveSupport::Concern
  SECRET_KEY = Rails.application.credentials.jwt_key!

  def jwt_encode(payload, exp = Time.zone.now + 1.day)
    payload[:exp] = exp.to_i
    JWT.encode(payload, SECRET_KEY, 'HS256')
  end

  def jwt_decode(token)
    decoded = JWT.decode(token, SECRET_KEY, true, { algorithm: 'HS256' })[0]
    HashWithIndifferentAccess.new decoded
  end
end
