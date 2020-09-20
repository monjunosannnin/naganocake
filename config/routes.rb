Rails.application.routes.draw do

  devise_for :admins, controllers: {
    sessions: "admins/sessions"
  }

  devise_for :customers

  namespace :admins do
    root "homes#top"
    resources :products
    resources :genres, only: [ :index, :create, :edit, :update ]
    resources :customers, only: [ :index, :show, :edit, :update ]
    resources :orders, only: [:index, :show, :update]
    resources :ordered_products, only: [:update]
  end

  scope module: :public do
    resources :customers
    resources :products, only: [ :index, :show ]
    resources :cart_items
  end
end
