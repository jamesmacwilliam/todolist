class TasksController < ApplicationController

  def index
    get_project
    @tasks = [] 
    @tasks = Task.where(project_id: params[:project_id])

    if @tasks.empty?
      flash[:alert] = "No tasks for you!"
    end
  end

  def edit
    get_user
    get_task
  end

  def new
    get_project
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      flash[:success] = "A new task lives!"
      redirect_to project_tasks_path
    else
      flash[:alert] = "Doh! Try again!"
      redirect_to new_project_task_path
    end
  end


  def complete
    get_task
    @task.toggle!(:completed)

    respond_to do |format|
      flash[:success] = "Task complete!"
      format.html { redirect_to project_tasks_path(@task.project.id) }
    end
  end

  # def destroy
  #   if @project.delete
  #     flash[:success] = "Your project has been buh-leted!"
  #     redirect_to user_projects_path
  #   else
  #     flash[:alert] = "Doh! Try again!"
  #     redirect_to new_user_project_path
  #   end
  # end

  private

  def task_params
    params.require(:task).permit(:title, :note, :completed, :project_id)
  end

  def get_project
    @project = Project.find(params[:project_id])
  end

  def get_task
    @task = Task.find(params[:id])
  end
end
