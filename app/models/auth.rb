# frozen_string_literal: true
class Auth
  def self.generate_token(payload)
    exp = Time.now.to_i + Integer(ENV['JWT_EXPIRATION_TIME'])
    JWT.encode(
      payload.merge(exp: exp),
      ENV['JWT_SECRET_KEY'],
      ENV['JWT_ALGORITHM']
    )
  end

  def self.decode_token(token)
    JWT.decode(token,
               ENV['JWT_SECRET_KEY'],
               true,
               algorithm: ENV['JWT_ALGORITHM']).first
  end
end
