class ItemsController < ApplicationController
  before_action :set_todo_list, only: [:create, :destroy, :check]

  def create
    @item = @todo.items.create(item_params.merge({user_id: current_user.id}))
    if @item.save
      redirect_to request.referrer 
    else
      flash[:danger] = "ops"
      redirect_to request.referrer 
    end
  end

  def destroy
    @item = @todo.items.find(params[:id]).destroy
    redirect_to request.referrer 
  end

  def check
    @item = @todo.items.find(params[:id])
    @item.update(checkbox: !@item.checkbox)
    redirect_to request.referrer
  end

  private

    def item_params
      params.require(:item).permit(:content, :checkbox)
    end
end
