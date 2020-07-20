Rails.application.routes.draw do
  get 'home/index'
  root 'home#index'
  get 'users/new'
  get 'sessions/login', to: 'sessions#login', as: :new_session
  post 'sessions/login', to: 'sessions#check'
  delete 'sessions/logout', to: 'sessions#destroy', as: :destroy_session
  resources :users, only:[:new, :create, :show]
  resources :articles
  resources :articles
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
