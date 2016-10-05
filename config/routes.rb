Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :sessions, only: [:new, :create, :destroy]


  scope  '/admin' do
    resources :products, :categories, :users, :members, :orders
    resource :orders do
        resource :lineitems, shallow: true
    end
  end

  get "log_out" => "sessions#destroy"
  get "log_in" => "sessions#new"
  get 'shop', to: 'shop#index'
  get 'shop/new', to: 'shop#new'
  get 'shop/hot', to: 'shop#hot'
end
