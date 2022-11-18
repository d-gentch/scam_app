Rails.application.routes.draw do
  get 'static_pages/home'
  get 'static_pages/about'
  devise_scope :user do
    # Redirests signing out users back to sign-in
    get "users", to: "devise/sessions#new"
  end

  devise_for :users
end