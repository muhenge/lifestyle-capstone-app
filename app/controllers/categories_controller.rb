class CategoriesController < ApplicationController
  include CategoriesHelper
  include ArticlesHelper
  before_action :set_category, only: %i[show edit update destroy vote]
  before_action :authenticate_user, except: %i[no_user_categories show]

  def index
    @categories = Category.all.order_by_priority
  end

  def show
    @cat_articles = @category.articles.ordered_by_most_recent
  end

  def no_user_categories
    @categories = Category.all.order_by_priority
  end
end
