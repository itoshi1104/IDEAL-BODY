class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user,only: [:show,:edit,:update,:destroy]
  
  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id
    if @task.save
      redirect_to tasks_path
    else
      render 'new'
    end
  end

  def index
    @tasks = Task.where(user_id: current_user.id)
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
    # unless @task.user == current_user
    #   redirect_to root_path
    # end
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to task_path(@task)
    else
      render 'edit'
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  # def my_calendar
  # end

  private
  
  def task_params
    params.require(:task).permit(:user_id, :title, :body, :start_date, :end_date)
  end
  
   def ensure_correct_user
      @task = Task.find(params[:id])
      if @task.user_id != current_user.id
        redirect_to articles_path
      end
   end

end
