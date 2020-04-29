Rails.application.routes.draw do
  match '*all', controller: 'application', action: 'cors_preflight_check', via: [:options]

  resources :registrations, only:[:create]
  resources :sessions, only:[:create ,:get]
  resources :barbers, only:[:show,:get]
  delete :logout, to: "sessions#logout"
  delete :logout, to: "sessions#logout"
  get :logged_in, to: "sessions#logged_in"
  get :barbers, to: "barbers#index"
  root to: "static#home"
end
