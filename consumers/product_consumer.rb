# frozen_string_literal: true

  require_relative '../models/product'
  require_relative "../config/initializers"

  puts "Initializing consuming of products news..."

  loop do
    event = CACHE.brpop(QUEUE, timeout: 5)

    next unless event
    puts "Mensaje recibido: #{event} #{Time.now}"
    data = JSON.parse(event[1], symbolize_names: true)
    if data[:action] == "create"
      id = data[:id]
      Product.db_create(id)
      puts "Product #{id} was stored in the BD"
    end
  end
