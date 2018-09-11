Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#index'

  get '/about', to: 'static_pages#about'

  get 'event/:id', to: 'events#show', as: "event"
  post 'event_participants', to: 'event_participants#create', as: "event_participants"

  devise_for :users, :controllers => { :registrations => "devise/registrations" }

  resources :events
  resources :locations
  resources :event_participants

  resources :conversations do
    resources :messages
  end

end
