Rails.application.routes.draw do
  resources :furnitures
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/profile', to: 'pages#profile'
  get '/forms', to: 'listings#forms'

  resources :listings do
    resources :bookings, only: %i[new create]
  end
end
