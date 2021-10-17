Rails.application.routes.draw do
  devise_for :users
  devise_for :devs
  
  resources :dev_profiles
  resources :expertises, only: [:new, :create]  
  resources :work_types, only: [:new, :create]
  resources :projects, only: [:index, :new, :create, :show], shallow: true do
    post 'end_project', on: :member
    get 'my_projects', on: :collection
    resources :project_propositions, only: [:new, :create, :index], shallow: true do
      post 'accept', on: :member
      post 'deny', on: :member
      post 'cancel', on: :member
    end
  end
  
  get '/search', to: "projects#search"
  
  root to: 'home#welcome'
end
