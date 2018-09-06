Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#index'

  devise_for :users, :controllers => { :registrations => "devise/registrations" }

  get '/about', to: 'static_pages#about'

  resources :events
  resources :locations

end
