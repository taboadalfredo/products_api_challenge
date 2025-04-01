# frozen_string_literal: true

def generate_token(username)
  payload = { user: username, exp: Time.now.to_i + 3600 }
  JWT.encode(payload, SECRET_KEY, 'HS256')
end

def authenticate!(token)
  begin
    decoded_token = JWT.decode(token, SECRET_KEY, true, { algorithm: 'HS256' })
    return decoded_token[0]['user']
  rescue
    JWT::DecodeError halt 401, { error: 'Invalid Token' }.to_json
  end
end
