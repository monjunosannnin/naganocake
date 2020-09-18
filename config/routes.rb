Rails.application.routes.draw do
  devise_for :customers
  devise_for :admin

  namespace :admin do
    root "homes#top"
      resources :products
  end

  scope module: :public do
    resources :customers
  end
end
