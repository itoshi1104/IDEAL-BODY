Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  resources :users,only: [:show,:edit,:update] do
    resources :tasks,only: [:index,:create,:destroy]
  end
  resources :articles  do
    collection do
       get :search
    end
    resource :comments,only: [:create,:destroy]
    resource :favorites,only: [:create,:destroy]
  end

end
