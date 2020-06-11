Rails.application.routes.draw do

  devise_for :users
  get '/chatrooms/find_and_redirect', as: :find_chatroom_and_redirect
  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end
  

  root to: 'pages#home'
  
  resources :dashboards, only: [:index]
  resources :projects, only: [:index, :show, :new, :create, :edit, :destroy]
  resources :profiles, only: [:new, :create]
  resources :developers, only: [:index, :show, :new, :create, :edit, :destroy]
  resources :chatrooms, only: :show

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
