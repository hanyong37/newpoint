Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace  :admin do
    root "orders#index"
    resources :products, :categories, :users, :members, :orders
    resources :lineitems
    resources :sessions, only: [:new, :create, :destroy]
  end

  #get '/auth/wechat' to omniauth, after wechat authentication, it will come back to callback;
  get '/auth/wechat/callback', to: 'weixin/sessions#create'
  namespace :weixin do
    root 'products#index'
    resource :session, only: [:create]
    resource :register, only: [:new, :create]
    resources :products, only: [:index, :show]
    #resource :shop, only: [:show]
  end

 # get "log_out" => "sessions#destroy"
 # get "log_in" => "sessions#new"
 # get 'shop', to: 'shop#index'
 # get 'shop/show_product', to: 'shop#show_product'
 # get 'shop/login', to: 'shop#login'
 # get 'shop/logout', to: 'shop#logout'
end
