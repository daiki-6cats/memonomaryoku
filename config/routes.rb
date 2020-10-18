Rails.application.routes.draw do
  get 'favorites/create'
  get 'favorites/destroy'
  get 'relationships/create'
  get 'relationships/destroy'
    root to: "toppages#index"
    
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  
  get 'memos/new', to: "memos#new"
  post 'memos/create'
  get 'memos/destroy'
  get 'memos/:id', to: 'memos#show'

  get "signup", to: "users#new"
  resources :users, only: [:index, :show, :new, :create] do
    member do
      get :followings
      get :followers
      get :likes
    end
  end
  
  resources :memos, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
  resources :favorites, only: [:create, :destroy]
  end
