Rails.application.routes.draw do

  devise_for :customers
  devise_for :admin

  namespace :admin do
    root "homes#top"
  end

  scope module: :public do
    
  end
end
