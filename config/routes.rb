Rails.application.routes.draw do
  devise_for :users

  resources :movies do
    resources :pictures, only: [:destroy]
  end

  get :dashboard, to: "dashboard#index"

  root "welcome#index"
end
