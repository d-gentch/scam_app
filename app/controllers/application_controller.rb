class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def set_todo_list
    @todo = Todo.find(params[:todo_id])
  end


  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation, :remember_me) }
      devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:login, :name, :email, :password, :remember_me) }
      devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :password_confirmation, :current_password, :avatar, :avatar_cache) }
    end
end
