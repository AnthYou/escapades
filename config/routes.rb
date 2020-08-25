Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :trips, only: [ :index, :create, :new, :show]
  resources :users, only: [:show] do
    resources :reviews, only: [ :new, :create ]
  end
end
