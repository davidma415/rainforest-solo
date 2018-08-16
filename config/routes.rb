Rails.application.routes.draw do
  get 'pages/landing'
  root 'products#index'
  resources :products do
    resources :reviews, except: [:index, :new, :show]
  end
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
end
