Rails.application.routes.draw do

  devise_for :admins, controllers: {
    sessions: "admins/sessions"
  }

  devise_for :customers, :controllers => {
    :registrations => 'customers/registrations',
    :sessions => 'customers/sessions'
  }

  # devise_scope :customer do
  #   get "sign_in", :to => "customers/sessions#new"
  #   get "sign_out", :to => "customers/sessions#destroy" 
  # end

  namespace :admins do
    root "homes#top"
    resources :products
    resources :genres, only: [ :index, :create, :edit, :update ]
    resources :customers, only: [ :index, :show, :edit, :update ]
  end

  scope module: :public do
    root 'homes#top'
    get 'top' => 'homes#top'
    get 'about' => 'homes#about'
    get '/customers' => 'customers#show',as: 'mypage'
    put "/customers/mypage/unsubscribe" => "customers#unsubscribe", as: 'customers_unsubscribe'
    resources :customers
    resources :products, only: [ :index, :show ]
  end
end