Rails.application.routes.draw do
  get 'itineraries/index'

  get 'itineraries/new'

  get 'itineraries/create'

  get 'itineraries/edit'

  get 'itineraries/update'

  get 'itineraries/show'

  get 'itineraries/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
