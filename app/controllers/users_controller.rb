class UsersController < ApplicationController
  def index
    @users = User.all    
    @users = @users.paginate(:page => params[:page], :per_page => 11) 
  end

  def show
    @user = User.find(params[:id])
    @todos = @user.todos
  end
end