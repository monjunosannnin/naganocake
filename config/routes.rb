Rails.application.routes.draw do
  devise_for :customer
  devise_for :admin
  scope module: :public do
    resources :customers
  end
end
