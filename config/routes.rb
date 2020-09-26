
Rails.application.routes.draw do
  get 'home/index'
  get 'home/private'
  devise_for :users do
    member do
      get :articles
    end
    delete "/users/sign_out" => "devise/sessions#destroy", :as => :destroy_user_session_path
  end
  root to: "home#index"
  # get 'home/index'
  get 'users/:user_id/articles' => 'users#articles', :as => :user_articles
  get '/users/:id' => 'users#show', :as => :user
  # resources :users
  # delete 'users/sign_out', to: 'devise#sessions'
  get '/articles/:id/vote' => 'articles#upvote'
  # get '/no_user_articles', to:'articles#no_user_articles'
  # get '/no_user_categories', to:'categories#no_user_categories'
  get '/articles/:id/not_vote' => 'articles#downvote'

  # delete 'sessions/logout', to: 'sessions#destroy', as: :destroy_session

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
