Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'test', to: 'pages#test'
  resources :pools, only: [:show, :new, :create, :edit, :update, :destroy] do
    resources :participants, only: [:new, :create, :edit, :update, :destroy] do
      get 'inject_model', to: 'pages#inject_model'
    end
    resources :draws, only: [:new, :create, :destroy]
  end
end
