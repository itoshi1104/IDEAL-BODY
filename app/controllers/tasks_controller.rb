class TasksController < ApplicationController
  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id
    @task.save ? (redirect_to user_task_path(@task)) : (render 'new')
  end

  def index
    @tasks = Task.where(user_id: current_user.id)
  end

  def show; end

  def edit
    redirect_to root_path unless @task.user == current_user
  end

  def update
    @task.update(task_params) ? (redirect_to user_task_path(@task)) : (render 'edit')
  end

  def destroy
    @task.destroy
    redirect_to my_calender_path
  end

  def my_calendar; end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def event_params
    params.require(:task).permit(:user_id, :title, :body, :start_date, :end_date)
  end
end
