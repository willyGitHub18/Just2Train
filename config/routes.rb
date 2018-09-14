Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#index'

  get '/about', to: 'static_pages#about'

  get 'events/futsal', to: 'events#index_futsal', as: "futsal"
  get 'events/cyclism', to: 'events#index_cyclism', as: "cyclism"
  get 'events/running', to: 'events#index_running', as: "running"
  get 'events/basketball', to: 'events#index_basketball', as: "basketball"
  get 'events/football', to: 'events#index_football', as: "football"

  get 'event/:id', to: 'events#show', as: "event"
  
  post 'event_participants', to: 'event_participants#create', as: "event_participants"

  devise_for :users, :controllers => { :registrations => 'users/registrations' }

  resources :events
  resources :locations
  resources :event_participants

  resources :conversations do
    resources :messages
  end

  resources :users, param: :username

end
