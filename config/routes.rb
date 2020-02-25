Rails.application.routes.draw do
devise_for :users
root to: 'pages#home'
resources :spots, only: [:index, :show, :new, :create]
resources :bookings, only: [:index, :show, :new, :create, :destroy]
end
