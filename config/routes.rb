Rails.application.routes.draw do
  devise_for :users

  get :dashboard, to: "dashboard#index"

  root "welcome#index"
end
