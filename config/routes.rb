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

    resources :posts, only: [:index, :create, :new, :show] do
      member do
        patch "like", to: "posts#like"
      end
    end
    resources :messages, only: [:index, :create] do
      member do
        patch "like", to: "messages#like"
      end
    end
  end

  resources :activities, only: [:edit, :update, :destroy]

  get '/filter', to: 'trips#filter'

  resources :bookings, only: [] do
    resources :reviews, only: [ :new, :create ]
  end

  resources :users, only: [:show] do
    resources :reviews, only: [ :new, :create, :show ]
    resources :posts, only: [:index, :create, :new, :show]
  end

  resources :reviews, only: [:destroy]

  resources :users, only: [:show] do
    member do
      patch "follow", to: "users#follow"
    end
  end

  get "/dashboard", to: "users#dashboard", as: :dashboard
  get "/notifications", to: "notifications#index", as: :notifications
  patch "notifications/:id/read", to: "notifications#notification_read", as: "notification_read"

  get '/tagged', to: "trips#tagged", as: :tagged

end
