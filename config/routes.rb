Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  resources :tasks
  resources :users, only: %i[show edit update]
  resources :articles do
    collection do
      get :search
    end
  resource :comments, only: %i[create destroy]
  resource :favorites, only: %i[create destroy]
  end
  resources :relationships, only: %i[create destroy]
  resources :notifications, only: %i[index]

end
