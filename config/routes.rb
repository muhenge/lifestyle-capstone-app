
Rails.application.routes.draw do
  root 'home#start'
  get 'admins/login'
  get 'admins/check'
  get 'admins/destroy'
  get 'home/index'
  get 'users/new'
  get 'sessions/login', to: 'sessions#login', as: :new_session
  get 'users/:authorid/articles' => 'users#articles', :as => :user_articles
  get '/sessions/logout' => 'sessions#destroy'
  get '/articles/:id/vote' => 'articles#upvote'
  get '/no_user_articles', to:'articles#no_user_articles'
  get '/no_user_categories', to:'categories#no_user_categories'
  get '/articles/:id/not_vote' => 'articles#downvote'
  post 'sessions/login', to: 'sessions#check'
  delete 'sessions/logout', to: 'sessions#destroy', as: :destroy_session
  resources :users, only: %i[new create show user_articles] do
    member do
      get :articles
    end
  end
  resources :articles do
    collection do
      get 'no_user_articles'
    end
  end
  resources :articles do
    member do
      put 'vote' => 'articles#upvote'
      put 'not_vote' => 'articles#downvote'
    end
  end 
  resources :categories do
    get 'no_user_categories'
  end
  # errors routes
  get '/404', to: 'errors#not_found'
  get '/422', to: 'errors#unacceptable'
  get '/500', to: 'errors#server_errors'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
