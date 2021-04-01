Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'sessions#new_login'
  post '/login', to: 'sessions#login'
  get 'users/:id/home', to: 'users#home', as: 'user_home'
  delete '/logout', to: 'sessions#logout'
  resources :users 
  resources :user_habits
  patch 'user_habits/:id/toggle_active', to: 'user_habits#toggle_active', as: 'toggle_active'
  resources :habit_logs, only: [:new, :create, :edit, :update]
  resources :friendships
  
  resources :habit_logs, only: [:new, :create, :edit, :update, :show] 

  resources :encouragements, only: [:new, :create, :edit, :update]
  resources :habits
end
