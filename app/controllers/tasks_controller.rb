class TasksController < ApplicationController
  # 以下を記述することで[]内の重複したコードがないようにする:set_taskメソッドはprivateに
  before_action :set_task, only: [:show, :update, :update, :destroy]

  def index
    # recentはtask.rbで記述したもの、中身はorder(created_at: :desc)
    @tasks = current_user.tasks.recent
  end

  def show
    # @task = current_user.tasks.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    # @task = Task.new(task_params)
    @task = current_user.tasks.new(task_params)
    if @task.save!
      redirect_to @task, notice: "タスク「#{@task.name}を登録しました。」"
    else
      render :new
    end
  end 

  def edit
    # @task = current_user.tasks.find(params[:id])
  end

  def update
    # task = current_user.tasks.find(params[:id])
    @task.update!(task_params)
    redirect_to tasks_url, notice: "タスク#{@task.name}を更新しました。"
  end

  def destroy
    # task = current_user.tasks.find(params[:id])
    @task.destroy
    redirect_to tasks_url, notice: "タスク「#{@task.name}」を削除しました。"
  end

  private

  def task_params
    params.require(:task).permit(:name, :description)
  end

  def set_task
    @task = current_user.tasks.find(params[:id])
  end
end
