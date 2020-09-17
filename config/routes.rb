Rails.application.routes.draw do


  devise_for :customers
  devise_for :admin
  scope module: :public do
    
  end
end
