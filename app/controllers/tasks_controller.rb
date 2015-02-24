class TasksController < ApplicationController
  belongs_to :project

  private

  def task_params
    params.require(:task).permit(:title, :note, :completed, :project_id)
  end
end
