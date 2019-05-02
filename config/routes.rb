Rails.application.routes.draw do
  root 'itineraries#index'

  resources :itineraries
  resources :events
end
