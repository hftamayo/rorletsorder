Rails.application.routes.draw do
  resources :ordertemps 
  resources :orders
  resources :clientaddresses
  resources :clients, param: :_email
  resources :meals
  post '/auth/login', to: 'authentication#login'
  get "/auto_login", to: "users#auto_login"
  post '/signup2', to: 'authentication#authenticate'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
