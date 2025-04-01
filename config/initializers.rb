# frozen_string_literal: true

require 'sinatra'
require 'json'
require 'jwt'
require 'securerandom'
require 'redis'
require_relative '../db/database'
require_relative '../models/user'
require_relative '../models/product'
require_relative '../controllers/auth_controller'
require_relative '../controllers/product_controller'

set :port, 4567

SECRET_KEY = "fudo-super-secret"
CACHE = Redis.new(url: ENV["REDIS_URL"] || "redis://redis:6379")
QUEUE = "products-news"
