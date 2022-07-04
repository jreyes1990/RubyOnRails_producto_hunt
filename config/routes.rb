Rails.application.routes.draw do
  get 'products/', to: 'products#index'
  get 'products/new', to: 'products#new', as: 'new_products'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post 'products', to: 'products#create'
  root "main#welcome"
end
