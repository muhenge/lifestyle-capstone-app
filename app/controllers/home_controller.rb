class HomeController < ApplicationController
  include HomeHelper
  include CategoriesHelper
  include ArticlesHelper
  require 'articles_controller'
  require 'categories_controller'
  before_action :current_user, only: %i[index articles]

  def index
    @categories = Category.all.priority
    all_upvotes = Article.all.pluck(:cached_votes_up).max
    @most_voted_art = Article.all.where(cached_votes_up: all_upvotes)
    @current_user
  end

  def articles
    @articles = Article.all
  end

  def start; end
end
