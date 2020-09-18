Rails.application.routes.draw do
  resources :user_workouts
  resources :workouts
  devise_for :users
  root to: "home#index"
end
