Rails.application.routes.draw do

  resources :lineitems
  resources :orders
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :sessions, only: [:new, :create, :destroy]

  get "log_out" => "sessions#destroy"

  get "log_in" => "sessions#new"

  scope  '/admin' do
    resources :products, :categories, :users, :members
  end
  get 'shop', to: 'shop#index'
  get 'shop/new', to: 'shop#new'
  get 'shop/hot', to: 'shop#hot'
end
