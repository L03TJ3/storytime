Rails.application.routes.draw do

  resources :authors do
    resources :poems
  end

  root "authors#index"

end
