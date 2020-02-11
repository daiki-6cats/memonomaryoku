Rails.application.routes.draw do

  get 'memos/new'
  get 'memos/create'
  get 'memos/destroy'
    root to: "toppages#index"
    
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  get "signup", to: "users#new"
  get "umakuhanneisareteirukana", to: "users#create"
  resources :users, only: [:index, :show, :new, :create]
  resources :memos, only: [:create, :destroy]
  end
