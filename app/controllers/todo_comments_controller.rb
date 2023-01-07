class TodoCommentsController < ApplicationController
  before_action :set_todo_list, only: [:create, :update, :destroy]

  def create
    @todo_comment = @todo.todo_comments.create(todo_comments_params.merge({user_id: current_user.id}))
    if @todo_comment.save
      redirect_to request.referrer 
    else
      redirect_to request.referrer 
    end
  end
  
  def update
    @todo_comment = @todo.todo_comments.find(params:[:id])
    if @todo_comment.update(todo_comments_params)
      redirect_to @todo
    end
  end

  def destroy
    @todo_comment = @todo.todo_comments.find(params:[:id]).destroy
    redirect_to request.referrer
  end

  private

  def set_todo_list
    @todo = Todo.find(params[:todo_id])
  end

    def todo_comments_params
      params.require(:todo_comment).permit(:body)
    end
end
