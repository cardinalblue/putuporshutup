Rails.application.routes.draw do
  root 'itineraries#index'
  devise_for :users

  resources :itineraries
  resources :events do
    get :attendee_respond
  end
end
