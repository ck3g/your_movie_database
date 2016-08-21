Rails.application.routes.draw do
  devise_for :users

  resources :movies

  get :dashboard, to: "dashboard#index"

  root "welcome#index"
end
