Rails.application.routes.draw do

resources :spots, only: [:index, :show, :new, :create]
end
