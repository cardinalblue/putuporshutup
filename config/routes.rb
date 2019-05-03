Rails.application.routes.draw do
  root 'itineraries#index'

  resources :itineraries
  resources :events do
    get :attendee_respond
  end
end
