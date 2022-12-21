Rails.application.routes.draw do
  devise_scope :user do
    get "users", to: "devise/sessions#new"
  end

  devise_for :users 

  root 'static_pages#home'
  
  resources :users, only: [:show]
  resources :todos, only: [:index, :create, :destroy] do 
    resources :items, only: [:create, :destroy] do
      member do
        post :check
      end
    end
  end
end