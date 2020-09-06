class SessionsController < ApplicationController
  include SessionsHelper

  def login
    @user = User.new
  end

  def check
    @current_user = User.where(name: user_params['name']).first
    if @current_user
      session[:auth] = @current_user
      redirect_to home_index_path
    else
      flash.notice = 'Incorrect name, try again'
      redirect_to new_session_path
    end
  end

  def destroy
    session.destroy
    redirect_to root_path
    # flash.notice = 'logged out'
  end
end
