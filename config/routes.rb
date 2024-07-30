Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  post '/login', to: 'auth#create'
  get '/profile', to: 'users#profile'
  post "/users", to: 'users#create'
  get "/users",to: "users#index"
  get "/users/:id", to: "users#show"
  get  '/tenants', to: 'tenants#index'
  get '/owners', to: 'owners#index'

  post '/properties', to: 'properties#create'
  get  '/properties/:id', to: "properties#show"
  get '/properties', to:'properties#index'

  post '/units',to: 'units#create'
  get '/units/:id', to: 'units#show'
  get '/units', to: 'units#index'

  post '/lease', to: 'leases#create'
  get '/leases', to: 'leases#index'
  get '/leases/:id', to: "leases#show"

  post '/requests', to: 'maintenance_requests#create'
  get '/requests/:id', to: 'maintenance_requests#show'
  get '/requests', to: 'maintenance_requests#index'

  
  
end

