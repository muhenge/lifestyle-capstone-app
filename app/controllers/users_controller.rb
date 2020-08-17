class UsersController < ApplicationController
  include UsersHelper
  before_action :current_user, except: %i[new create]
  def new
    @user = User.new
  end

  def articles
    @user = User.find(params[:authorid])
    @articles = @user.articles
  end

  def user_articles
    current_user.id = Article.authorid
    @author = User.find(params[:authorid])
    @articles = @author.articles
  end

  def destroy
    Article.find(params[:id]).destroy
    redirect_to articles_path
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash.notice = 'Account created'
      session[:auth] = @user
      redirect_to new_session_path
    else
      flash.notice = 'Account not created, try again'
      render 'new'
    end
  end
end
