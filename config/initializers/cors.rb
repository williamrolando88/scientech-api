Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'localhost:3000', 'https://scientech-ec.netlify.app', 'https://www.scientech-ec.com'
    resource '*', headers: :any, methods: [:get, :post, :patch, :put]
  end
end