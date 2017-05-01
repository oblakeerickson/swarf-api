class TodosController < ApplicationController

  def index
    @list = List.find(params[:list_id])
    @todos = @list.todos.where(done: [false, nil])
    render json: @todos, status: :ok
  end

  def show
    @list = List.find(params[:list_id])
    @todo = @list.todos.find_by!(id: params[:id]) if @list
    render json: @todo, status: :ok
  end

  def create
    @list = List.find(params[:list_id])
    @todo = @list.todos.create!(todo_params)
    render json: @todo, status: :created
  end

  def update
    @list = List.find(params[:list_id])
    @todo = @list.todos.find_by!(id: params[:id]) if @list
    @todo.update(todo_params)
    head :no_content
  end

  def destroy
    @list = List.find(params[:list_id])
    @todo = @list.todos.find_by!(id: params[:id]) if @list
    @todo.destroy
    head :no_content
  end

  private

  def todo_params
    params.permit(:name, :done)
  end

end
