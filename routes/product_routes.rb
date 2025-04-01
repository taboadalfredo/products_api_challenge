# frozen_string_literal: true

  post '/products' do
    token = request.env['HTTP_AUTHORIZATION']&.split(' ')&.last
    authenticate!(token)
    data = JSON.parse(request.body.read)
    product = create_product(data['description'])
    {message: 'Product created', id: product.id }.to_json
  end

  get '/products/:id' do
    token = request.env['HTTP_AUTHORIZATION']&.split(' ')&.last
    authenticate!(token)
    id = params[:id]
    product = find(id)
    product.to_json
  end

  get '/products' do
    token = request.env['HTTP_AUTHORIZATION']&.split(' ')&.last
    authenticate!(token)
    products.to_json
  end

