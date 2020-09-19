Rails.application.routes.draw do

  devise_for :admins, controllers: {
    sessions: "admins/sessions"
  }

  devise_for :customers, controllers: {
    sessions: "coutomers/sessions"
  }

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
    resources :customers
  end
end