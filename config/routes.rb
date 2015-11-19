Rails.application.routes.draw do
  resources :photos, only: [:new, :create, :index] do
    member do
      post :draw
    end

    collection do
      post :reset
    end
  end

  root to: "photos#new"
end
