Rails.application.routes.draw do

  devise_for :admins, controllers: {
    sessions: "admins/sessions"
  }

  devise_for :customers, :controllers => {
    :registrations => 'customers/registrations',
    :sessions => 'customers/sessions'
  }

  namespace :admins do
    root "homes#top"
    resources :products
    resources :genres, only: [ :index, :create, :edit, :update ]
    resources :customers, only: [ :index, :show, :edit, :update ]
    resources :orders, only: [:index, :show, :update]
    resources :ordered_products, only: [:update]
  end

  scope module: :public do
    root 'homes#top'
    get 'top' => 'homes#top'
    get 'about' => 'homes#about'
    get '/customers' => 'customers#show',as: 'mypage'
    get '/customers/mypage/withdrawal' => 'customers#withdrawal', as: 'customers_withdrawal'
    put '/customers/mypage/unsubscribe' => 'customers#unsubscribe', as: 'customers_unsubscribe'
    delete '/cart_items/destroy_all' => 'cart_items#destroy_all'
    post '/orders/confirm' => 'orders#confirm'
    get '/orders/complete' => 'orders#complete'
    resources :customers
    resources :products, only: [ :index, :show ]
    resources :cart_items, only: [ :index, :create, :update, :destroy ]
    resources :orders, only: [ :new, :show, :create, :index ]
  end
end