Rails.application.routes.draw do
devise_for :users
root to: 'pages#home'
get '/spots-my-spots', to: 'spots#indexMySpots', as: 'myspots'
get'/bookings/:id/decline', to: 'bookings#decline', as: 'decline'
get'/bookings/:id/confirm', to: 'bookings#confirm', as: 'confirm'

resources :spots, only: [:index, :show, :new, :create, :destroy, :edit, :update] do
    resources :bookings, only: [:create]
  end
resources :bookings, only: [:index, :show, :update, :destroy]

resources :users, only: [:index, :show, :edit, :update, :destroy]
end
