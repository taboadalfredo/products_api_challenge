# frozen_string_literal: true

require_relative '../models/product'

def create_product(description)
  Product.create(description)
end

def products
  Product.products
end

def find(id)
  Product.find(id)
end