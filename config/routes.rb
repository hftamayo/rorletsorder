Rails.application.routes.draw do
  resources :ordertemps
  resources :orders
  resources :clientaddresses
  resources :clients
  resources :meals
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
