class SessionsController < ApplicationController
  skip_before_filter :require_login, :only => [:new, :create]

  def new
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      flash[:success] = "Welcome back, #{user.email}"
      redirect_to user_projects_path(user.id)
    else
      flash[:alert] = "There was a problem logging you in."
      redirect_to log_in_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Come back soon!"
    redirect_to "/"
  end

end
