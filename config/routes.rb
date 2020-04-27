Rails.application.routes.draw do
  resources :registrations, only:[:create]
  resources :sessions, only:[:create]
  root to: "static#home"
end
