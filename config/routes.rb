Rails.application.routes.draw do

  root            'static_pages#home'
  get  'about' => 'static_pages#about'

  devise_scope :user do
    # Redirests signing out users back to sign-in
    get "users", to: "devise/sessions#new"
  end

  devise_for :users

  resources  :users, only: [ :show ]
end