Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :trips, only: [ :index, :create, :new, :show] do
    resources :bookings, only: [:new, :create]
    resources :activities, only: [:new, :create]
    resources :posts, only: [:index, :create, :new, :show]
  end

  resources :bookings, only: [] do
    resources :reviews, only: [ :new, :create ]
  end

  resources :users, only: [:show] do
    resources :reviews, only: [ :new, :create, :show ]
    resources :posts, only: [:index, :create, :new, :show]
  end

  resources :reviews, only: [:destroy]

  resources :users, only: [:show]
  get "/dashboard", to: "users#dashboard", as: :dashboard
end
