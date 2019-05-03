Rails.application.routes.draw do
  devise_for :users
  root 'itineraries#index'

  resources :itineraries
  resources :events do
    get :attendee_respond
  end
end
