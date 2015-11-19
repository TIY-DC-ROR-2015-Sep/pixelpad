Rails.application.routes.draw do
  resources :photos

  root to: "photos#new"
end
