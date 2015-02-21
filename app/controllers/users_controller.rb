class UsersController < ApplicationController
  skip_before_filter :require_login, :only => [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'Right on! Start TAKING CARE OF BUSINESS!'
      redirect_to "/"
    else
      flash[:alert] = "Something went wrong. Let's try again."
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
