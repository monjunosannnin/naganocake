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
    resource :ordered_products, only: [:update]
  end

  scope module: :public do
    resources :customers
  end
end
