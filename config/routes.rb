Rails.application.routes.draw do
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope  '/admin' do
    resources :products, :categories, :users
  end
  get 'shop', to: 'shop#index'
  get 'shop/new', to: 'shop#new'
  get 'shop/hot', to: 'shop#hot'
end
