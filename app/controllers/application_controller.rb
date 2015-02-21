class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :require_login

  helper_method :current_user

  def require_login
    unless current_user
      redirect_to log_in_path, :alert => "You must be logged in!"
    end
  end

  def current_user
    return @current_user if defined?(@current_user)

    if session[:user_id]
      user = User.where(:id => session[:user_id]).first
      if user
        @current_user = user
      else
        session[:user_id] = nil
      end
    end
  end
end
