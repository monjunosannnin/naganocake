Rails.application.routes.draw do

  devise_for :admins, controllers: {
    sessions: "admins/sessions"
  }

  devise_for :customers

  namespace :admins do
    root "homes#top"
      resources :products
  end

  scope module: :public do
    resources :customers
  end
end
