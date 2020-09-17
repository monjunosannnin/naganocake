Rails.application.routes.draw do

  devise_for :admin
  devise_for :customers

  scope module: :public do
    
  end
end
