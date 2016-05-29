Rails.application.routes.draw do

  resources :authors
  resources :poems

  root "authors#index"

end
