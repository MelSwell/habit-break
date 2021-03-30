Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'sessions#new_login'
  post '/login', to: 'sessions#login'
  get 'users/:id/home', to: 'users#home', as: 'user_home'
  resources :users 
  resources :user_habits
  resources :habit_logs, only: [:new, :create, :edit, :update, :show] 

  resources :encouragements, only: [:new, :create]
end
