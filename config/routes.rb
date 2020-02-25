Rails.application.routes.draw do
devise_for :users
root to: 'pages#home'
resources :spots, only: [:index, :show, :new, :create, :destroy] do
    resources :bookings, only: [:create]
  end
resources :bookings, only: [:index]
resources :users, only: [:index, :show, :edit, :update, :destroy]
end
