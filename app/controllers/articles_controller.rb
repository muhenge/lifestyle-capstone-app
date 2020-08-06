class ArticlesController < ApplicationController
  include ArticlesHelper

  before_action :set_article, only: %i[show edit update destroy upvote downvote]
  before_action :current_user

  def index
    @articles = Article.all.ordered_by_most_recent
    @categories = Category.all
  end


  def show; end

  def edit; end

  def update
    @article.update(article_params)
    redirect_to articles_path
  end

  def new
    @article = Article.new
    @categories = Category.all
  end

  def create
    @article = Article.new(article_params)
    @article.authorid = current_user.id
    if @article.save
      redirect_to articles_path
    else
      render 'new'
      # render 'new'
    end
  end

  def destroy
    Article.find(params[:id]).destroy
    redirect_to articles_path
  end

  def upvote
    @article.upvote_by current_user
    redirect_to articles_path
  end


  def downvote
    @article.downvote_by current_user
    redirect_to articles_path
  end
end