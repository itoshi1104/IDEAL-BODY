Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  
  resources :tasks
    # get 'my_calendar', to: 'tasks#my_calendar'
  resources :users, only: %i[show edit update] 
    # resources :tasks
    # get 'my_calendar', to: 'tasks#my_calendar'
    # URLが/users/my_calendar の場合,
    # taskのcontrollerのmy_calendarアクションを実行します
  
  resources :articles do
    collection do
      get :search
    end
    resource :comments, only: %i[create destroy]
    resource :favorites, only: %i[create destroy]
  end
end
