class TodosController < ApplicationController

  before_action :find_todo, only: [:upvote, :downvote, :follow, :unfollow]

  def index
    @todos = current_user.todos
    @todos = @todos.order("rating DESC")
  end

  def create
    @todo = current_user.todos.create(todo_params) 
    if @todo.save
      redirect_to request.referrer 
    else
      flash[:danger] = "ops"
    end
  end

  def destroy
    todo = Todo.find(params[:id]).destroy
    flash[:success] = "List deleted!"
    redirect_to request.referrer 
  end

  def upvote
    vote = Vote.find_or_create_by(user_id: current_user.id, todo_id: @todo.id)
    vote.update(rating: 1)
    redirect_to request.referrer 
  end
  
  def downvote
    vote = Vote.find_or_create_by(user_id: current_user.id, todo_id: @todo.id)
    vote.update(rating: -1)
    redirect_to request.referrer 
  end

  def follow
    UsersTodo.find_or_create_by(user_id: current_user.id, todo_id: @todo.id)
    redirect_to request.referrer 
  end

  def unfollow
    users_todo = UsersTodo.find_by(user_id: current_user.id, todo_id: @todo.id)
    unless users_todo.nil?
      users_todo.destroy
    end
    redirect_to request.referrer 
  end

  private
  
    def find_todo
      @todo = Todo.find(params[:id])
    end

    def todo_params
      params.require(:todo).permit(:title, :checkable, :rating)
    end
end
