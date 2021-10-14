Rails.application.routes.draw do
  devise_for :users
  devise_for :devs
  

  resources :dev_profiles
  resources :expertises, only: [:new, :create]  
  resources :projects, only: [:index, :new, :create, :show] do
    get 'my_projects', on: :collection
  end
  get 'search', to:"home#search"
  resources :work_types, only: [:new, :create]
  root to: 'home#welcome'
end
