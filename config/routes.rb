Rails.application.routes.draw do
  devise_for :users
  devise_for :devs

  resources :dev_profiles
  resources :expertises, only: [:new, :create]  
    
  root to: 'home#welcome'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
