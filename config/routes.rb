Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :trips, only: [ :index, :create, :new, :show] do
    resources :bookings, only: [:new, :create]

    patch "bookings/:id/cancel", to: "bookings#cancel", as: "cancel_booking"
    patch "bookings/:id/accept", to: "bookings#accept", as: "accept_booking"
    patch "bookings/:id/decline", to: "bookings#decline", as: "decline_booking"

    get "bookings", to: "bookings#review", as: "review_booking"
    resources :activities, only: [:new, :create]
    resources :posts, only: [:index, :create, :new, :show]
    resources :messages, only: [:index, :create]
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
