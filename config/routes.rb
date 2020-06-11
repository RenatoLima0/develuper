Rails.application.routes.draw do

  devise_for :users

  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end
  

  root to: 'pages#home'
  
  resources :dashboards, only: [:index]
  resources :projects, only: [:index, :show, :new, :create, :edit, :destroy]
  resources :profiles, only: [:new, :create]
  resources :developers, only: [:index, :show, :new, :create, :edit, :destroy]


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
