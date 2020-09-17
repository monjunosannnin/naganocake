Rails.application.routes.draw do
  devise_for :admin
  devise_for :customer
  
  namespace :admin do
    root "homes#top"
  end

  scope module: :public do
    resources :customers
  end
end
