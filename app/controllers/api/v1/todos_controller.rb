class Api::V1::TodosController < Api::V1::BaseController
  before_action :set_todo, only: [:show, :update, :destroy]

  def index
    todos = @current_user.todos.includes(:todo_items)
    render json: todos, include: :todo_items
  end

  def show
    render json: @todo, include: :todo_items
  end

  def create
    todo = @current_user.todos.build(todo_params)

    if todo.save
      render json: todo, status: :created
    else
      render json: { errors: todo.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @todo.update(todo_params)
      render json: @todo
    else
      render json: { errors: @todo.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @todo.destroy
    render json: { message: "Todo deleted" }
  end

  private

  def set_todo
    @todo = @current_user.todos.find(params[:id])
  end

  def todo_params
    params.permit(:title)
  end
end



