Rails.application.routes.draw do

  resources :authors
  resources :poems
  resources :stories

  root "authors#index"

end
