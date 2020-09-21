class ArticlesController < ApplicationController
  include ArticlesHelper
  before_action :set_article, only: %i[show edit update destroy upvote downvote]
  before_action :current_user, only: %i[index upvote downvote new create]

  def index
    @articles = Article.all.ordered_by_most_recent
    @categories = Category.all.priority
  end

  def show; end

  def edit; end

  def update
    @article.update(article_params)
    redirect_to articles_path
  end

  def new
    @article = current_user.articles.build
    @categories = Category.all
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      redirect_to articles_path
      flash.notice = "Article '#{@article.title}' Created"
    else
      render 'new'
      flash.notice = 'Article not created,try again'
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

  def no_user_articles
    @articles = Article.all.ordered_by_most_recent.limit(8)
  end
end
