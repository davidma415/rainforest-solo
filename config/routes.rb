Rails.application.routes.draw do
  get 'pages/landing'
  root 'products#index'
  resources :products do
    resources :reviews, except: [:index, :new, :show]
  end
  resource :users, only: [:new, :create]
  resource :sessions, only: [:new, :create, :destroy]
end
