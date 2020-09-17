Rails.application.routes.draw do
  devise_for :admin
  
  namespace :admin do
    root "homes#top"
  end
end
