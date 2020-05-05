Rails.application.routes.draw do
  match '*all', controller: 'application', action: 'cors_preflight_check', via: [:options]

  resources :registrations, only:[:create]
  resources :bookings, only:[:create ,:get]
  resources :sessions, only:[:create ,:get]
  resources :barbers, only:[:show,:get]
  delete :logout, to: "sessions#logout"
  delete :logout, to: "sessions#logout"
  get :sessions, to: "sessions#create"
  get :loggedin, to: "sessions#logged_in"
  get :barbers, to: "barbers#index"
  get :bookings, to: "bookings#index"
  get :show, to: "bookings#show"
  post :bookings, to: "bookings#create"
  root to: "static#home"
end
