Rails.application.routes.draw do
  post '/auth/login', to: 'authentication#login'
  get "/auto_login", to: "users#auto_login"
  post '/signup2', to: 'authentication#authenticate'
  post '/auth/logout', to: 'authentication#logout'
  post '/auth/logged_in', to: 'authentication#is_logged_in?' 
  
  resources :ordertemps 
  resources :orders
  resources :clientaddresses
  resources :clients, param: :_email
  resources :meals
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
