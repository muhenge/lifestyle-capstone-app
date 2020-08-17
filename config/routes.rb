
Rails.application.routes.draw do
  root 'home#start'
  get 'admins/login'
  get 'admins/check'
  get 'admins/destroy'
  get 'home/index'
  get 'home/index'
  get 'users/new'
  get 'sessions/login', to: 'sessions#login', as: :new_session
  get 'users/:authorid/articles' => 'users#articles', :as => :user_articles
  # get 'articles/author_article' => 'articlesor_article'
  # get 'admins/login', to: 'sessions#login', as: :new_session
  get '/sessions/logout' => 'sessions#destroy'
  get '/articles/:id/vote' => 'articles#upvote'
  get '/articles/:id/not_vote' => 'articles#downvote'
  post 'sessions/login', to: 'sessions#check'
  post 'admins/login', to: 'admins#check'
  post 'admins/check', to: 'admins#check'
  delete 'sessions/logout', to: 'sessions#destroy', as: :destroy_session
  resources :users, only: %i[new create show user_articles] do
    member do
      get :articles
    end
  end
  resources :articles
  resources :admins
  resources :articles do
    member do
      put 'vote' => 'articles#upvote'
      put 'not_vote' => 'articles#downvote'
    end
  end
  resources :categories
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
