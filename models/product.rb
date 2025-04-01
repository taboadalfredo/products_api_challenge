# frozen_string_literal: true

class Product
  attr_accessor :id, :description

  def initialize(description)
    @id = SecureRandom.uuid
    @description = description
  end

  def self.db_create(id)
    PRODUCTS[id] = CACHE.get(id)
  end

  def self.create(description)
    product = new(description)
    CACHE.set(product.id, { id: product.id, description: product.description }.to_json)
    CACHE.lpush(QUEUE, { action: "create", id: product.id }.to_json)
    product
  end

  def self.find(id)
    cached_product = CACHE.get(id)
    return JSON.parse(cached_product, symbolize_names: true) if cached_product
    product = PRODUCTS[id]
    CACHE.set(product.id, { id: product.id, description: product.description }.to_json)
  end

  def self.products
    PRODUCTS
  end
end
