Rails.application.routes.draw do
  get '/leaderboard', to: 'users#leaderboard', as: "svg"
  get '/contact', to: 'pages#contact'

  devise_for :users

  scope '(:locale)', locale: /en/ do
    root to: 'pages#home'
  end

  resources :missions, only: [:show] do
    resources :user_missions, only: [:show, :create]
  end

  namespace :ambassador do
    resources :users, only: %I[show], path: :dashboard, as: :dashboard
  end

  namespace :coordinator do
    resources :users, only: %I[show], path: :dashboard, as: :dashboard
    resources :missions, only: [:new, :create, :edit, :update]
  end

  namespace :supervisor do
    resources :users, only: %I[show], path: :dashboard, as: :dashboard
    resources :missions, only: [:new, :create, :edit, :update]
    resources :resources, only: %I[new create edit update destroy]
  end

  resources :resources, only: %I[index show]
end
