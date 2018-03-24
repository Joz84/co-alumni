Rails.application.routes.draw do
  devise_for :users

  scope '(:locale)', locale: /en/ do
    root to: 'pages#home'
  end

  namespace :ambassador do
    resources :users, only: %I[show], path: :dashboard, as: :dashboard
  end

  namespace :coordinator do
    resources :users, only: %I[show], path: :dashboard, as: :dashboard
  end

  namespace :supervisor do
    resources :users, only: %I[show], path: :dashboard, as: :dashboard
  end
end
