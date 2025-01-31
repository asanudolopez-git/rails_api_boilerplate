class TasksController < BaseController
  before_action :set_task, only: [:show, :update, :destroy]
  before_action :authorize_post, only: %i[show update destroy]

  def index
    @tasks = @user.tasks
    render json: @tasks, each_serializer: TaskSerializer
  end

  def show
    render json: @task, serializer: TaskSerializer
  end

  def create
    @task = @user.tasks.build(task_params)
    if @task.save
      render json: @task, serializer: TaskSerializer, status: :ok
    else
      render json: { errors: @task.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @task.update(task_params)
      render json: @task, serializer: TaskSerializer
    else
      render json: { errors: @task.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy
    render json: @task, serializer: TaskSerializer, status: :ok
  end

  private

  def authorize_post
    render json: { message: "Unauthorized" }, status: :unauthorized unless @user == @task.user
  end

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name)
  end
end