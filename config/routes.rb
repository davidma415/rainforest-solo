Rails.application.routes.draw do
  get 'pages/landing'
  root 'products#index'
  resources :products do
    resources :reviews, except: [:index, :new, :show]
  end

end
