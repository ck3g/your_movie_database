Rails.application.routes.draw do
  devise_for :users

  resources :movies, only: [:new, :create, :show, :destroy]

  get :dashboard, to: "dashboard#index"

  root "welcome#index"
end
