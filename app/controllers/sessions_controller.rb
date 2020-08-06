class SessionsController < ApplicationController

  include SessionsHelper

  def login
    @user = User.new
  end

  def check
    @current_user = User.where(username: user_params['username']).first
    if @current_user
      session[:auth] = @current_user
      redirect_to articles_path
    else
      flash.notice = 'Incorrect username, try again'
      redirect_to new_session_path
    end
  end

  def destroy
    session.destroy
    redirect_to root_path
    flash.info = 'logged out'
  end
end