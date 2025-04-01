# frozen_string_literal: true

  require 'zlib'
  require 'stringio'
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

  def zip_response(request, response, product)
    if request.env["HTTP_ACCEPT_ENCODING"]&.include?("gzip")
      response['Content-Encoding'] = 'gzip'
      response.body = gzip(product.to_json)
    else
      product.to_json
    end
  end

  def gzip(body)
    sio = StringIO.new
    gz = Zlib::GzipWriter.new(sio)
    gz.write(body)
    gz.close
    sio.string
  end