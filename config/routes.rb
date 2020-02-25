Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  get 'users/edit'
  get 'users/update'
  get 'users/destroy'
devise_for :users
root to: 'pages#home'
resources :spots, only: [:index, :show, :new, :create, :destroy] do
    resources :bookings, only: [:create]
  end
resources :bookings, only: [:index]
end
