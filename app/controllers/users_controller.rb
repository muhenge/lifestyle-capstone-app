class UsersController < ApplicationController
    before_action :current_user, except: %i[new create]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash.notice = 'User created'
      session[:auth] = @user
      redirect_to new_article_path
    else
      flash.notice = 'User not created'
      render 'new'
    end
  end
  private

  def user_params
    params.require(:user).permit(:username)
  end
end
