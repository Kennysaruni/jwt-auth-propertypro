Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  post "/users", to: 'users#create'
  get "/users",to: "users#index"
  get '/profile', to: 'users#profile'
  post '/login', to: 'auth#create'
  get  '/tenants', to: 'tenants#index'
  get '/owners', to: 'owners#index'

  post '/properties', to: 'properties#create'
  post '/units',to: 'units#create'
  get '/properties', to:'properties#index'
  post '/lease', to: 'leases#create'
  get '/leases', to: 'leases#index'

  
  
end

