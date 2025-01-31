class TasksController < BaseController
  before_action :set_task, only: [:show, :update, :destroy]

  def index
    debugger
    @tasks = @user.tasks
    render json: @tasks, each_serializer: TaskSerializer
  end

  def show
  end

  def create
    @task = @user.tasks.build(task_params)
    if @task.save
      render :show, status: :created
    else
      render json: { message: @task.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @task.update(task_params)
      render :show, status: :ok
    else
      render json: { message: @task.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy
    render :show, status: :ok
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name)
  end
end