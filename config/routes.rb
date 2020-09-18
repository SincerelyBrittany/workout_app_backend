Rails.application.routes.draw do
  resources :user_workouts
  resources :workouts
  # devise_for :users
  root to: "home#index"

  devise_for :users,
            path: '',
            path_names: {
              sign_in: 'login',
              sign_out: 'logout',
              registration: 'signup'
            },
            controllers: {
              sessions: 'sessions',
              registrations: 'registrations'
            }
end
