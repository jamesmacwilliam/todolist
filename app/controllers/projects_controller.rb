class ProjectsController < ApplicationController
  before_filter :get_project, :only => [:edit, :update, :destroy]

  def index
    @projects = current_user.projects
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to user_projects_path, :success =>"Your project lives!"
    else
      redirect_to new_user_project_path, :alert => "Doh! Try again!"
    end
  end

  def edit
  end

  def update
    @project.update!(project_params)

    if @project.save
      flash[:success] = "Your project has been updated!"
      redirect_to user_projects_path(@user.id)
    else
      flash[:alert] = "Doh! Try again!"
      redirect_to new_user_project_path
    end
  end

  def destroy
    if @project.delete
      flash[:success] = "Your project has been buh-leted!"
      redirect_to user_projects_path
    else
      flash[:alert] = "Doh! Try again!"
      redirect_to new_user_project_path
    end
  end

  private

  def project_params
    params.require(:project).permit(:title, :note, :user_id)
  end

  def get_project
    @project = Project.find(params[:id])
  end
end
