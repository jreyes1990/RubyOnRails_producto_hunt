Rails.application.routes.draw do
  resources :categories
  #get 'products/', to: 'products#index'
  #get 'products/new', to: 'products#new', as: 'new_product'

  #get 'products/:id', to: 'products#show', as: :product

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #post 'products', to: 'products#create'

  #get 'products/:id/edit', to: 'products#edit', as: :edit_product
  #patch 'products/:id', to: 'products#update'

  resources :products do
    get 'search', on: :collection #products/search => products#search
    resources :comments, only: [:create]
  end

  root "main#welcome"
end
