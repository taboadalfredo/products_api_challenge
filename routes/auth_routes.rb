# frozen_string_literal: true

post '/login' do
  data = JSON.parse(request.body.read)
  if User.authenticate(data['username'], data['password'])
    { token: generate_token(data['username']) }.to_json
  else
    halt 401, { error: 'Invalid Credentials' }.to_json
  end
end
