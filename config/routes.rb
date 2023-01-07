Rails.application.routes.draw do
  devise_for :users

  root 'static_pages#home'
  
  resources :users, only: [:show, :index]
  resources :feeds, only: [:index]
  resources :todos, only: [:index, :create, :destroy] do 
    member do
      post :upvote
      post :downvote
      post :follow
      post :unfollow
    end
    resources :items, only: [:create, :destroy] do
      member do
        post :check
      end
    end
    resources :todo_comments, only: [:create, :destroy, :update]
  end
end