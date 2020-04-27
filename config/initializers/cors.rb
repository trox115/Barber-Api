Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins "http://localhost:3000"
    resource "*", headers: :any, methods: [:get, :post, :patch, :delete, :options, :head],
      crentials: true
  end
  allow do
    origins "https://antonio-barber-api.herokuapp.com"
    resource "*", headers: :any, methods: [:get, :post, :patch, :delete, :options, :head],
      crentials: true
  end
end

