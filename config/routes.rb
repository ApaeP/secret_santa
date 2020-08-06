Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :pools do
    resources :participants, only: [:new, :create]
    resources :draws, only: [:new, :create]
  end
end
