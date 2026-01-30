class Api::V1::TodoItemsController < Api::V1::BaseController
  before_action :set_todo
  before_action :set_item, only: [:show, :update, :destroy]

  def show
    render json: @item
  end

  def create
    item = @todo.todo_items.build(item_params)

    if item.save
      render json: item, status: :created
    else
      render json: { errors: item.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @item.update(item_params)
      render json: @item
    else
      render json: { errors: @item.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
    render json: { message: "Todo item deleted" }
  end

  private

  def set_todo
    @todo = @current_user.todos.find(params[:todo_id])
  end

  def set_item
    @item = @todo.todo_items.find(params[:id])
  end

  def item_params
    params.permit(:title, :completed)
  end
end
