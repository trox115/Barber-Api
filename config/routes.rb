Rails.application.routes.draw do


  match '*all', controller: 'application', action: 'cors_preflight_check', via: [:options]
  resources :registrations, only:[:create]
  delete :logout, to: "sessions#logout"
  post :sessions, to: "sessions#create"
  get :loggedin, to: "sessions#logged_in"
  get :bookings, to: "bookings#index"
  get :barbers , to: "barbers#index"
  get :show, to: "bookings#show"
  post :bookings, to: "bookings#create"
  root to: "static#home"
end
