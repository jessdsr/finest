Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/profile', to: 'pages#profile'

  resources :listings do
    resources :bookings, only: %i[new create]
  end
end
