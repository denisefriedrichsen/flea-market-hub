Rails.application.routes.draw do
devise_for :users
root to: 'pages#home'
resources :spots, only: [:index, :show, :new, :create] do
    resources :bookings, only: [:create, :index]
  end
end
