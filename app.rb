# frozen_string_literal: true

require 'sinatra'

require_relative 'config/initializers'
require_relative 'routes/auth_routes'
require_relative 'routes/product_routes'

get '/openapi' do
  response.headers['Cache-Control'] = 'no-store, no-cache, must-revalidate, proxy-revalidate'
  response.headers['Pragma'] = 'no-cache'
  response.headers['Expires'] = '0'
  send_file 'openapi.yaml'
end

get '/AUTHORS' do
  response.headers['Cache-Control'] = 'public, max-age=86400'  # 86400 segundos = 24 horas
  send_file 'AUTHORS'
end