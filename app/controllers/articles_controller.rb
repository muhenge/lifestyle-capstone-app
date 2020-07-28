class ArticlesController < ApplicationController
  include ArticlesHelper
  before_action :set_article, only: [:show, :edit, :update, :destroy, :vote]
  before_action :current_user

  def index
    @articles = Article.all.ordered_by_most_recent
    @categories = Category.all
    #@articles_for_author = Article.article_by_author
  end

  def show
  end

  def edit
  end

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
      render "new"
      #render 'new'
    end
  end

  def destroy
    Article.find(params[:id]).destroy
    redirect_to articles_path
  end

  def vote
  end

end
