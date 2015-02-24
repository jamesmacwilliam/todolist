class ProjectsController < ApplicationController

  private

  def project_params
    params.require(:project).permit(:title, :note, :user_id)
  end

  def begin_of_association_chain
    current_user
  end
end
