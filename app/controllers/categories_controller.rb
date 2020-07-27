class CategoriesController < ApplicationController
  include CategoriesHelper
  before_action :set_category, only: [:show, :edit, :update, :destroy, :vote]
  #before_action :current_user

  def index
    @categories = Category.all
    #@articles_for_author = Article.article_by_author
  end

  def show
  end

  def edit
  end

  def update
    @category.update(categories_params)
    redirect_to categories_path
  end

  def new
    @category = Category.new
      #@cat_all = Category.all
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to home_index_path
    else
      render 'new'
    end
  end

  def destroy
    Category.find(params[:id]).destroy
    redirect_to articles_path
  end

end
