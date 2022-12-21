class TodosController < ApplicationController
  def index
    @todos = current_user.todos
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
    @todo = Todo.find(params[:id]).destroy
    flash[:success] = "List deleted!"
    redirect_to request.referrer 
  end

  private

    def todo_params
      params.require(:todo).permit(:title, :checkable)
    end
end
