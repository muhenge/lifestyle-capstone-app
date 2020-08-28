class HomeController < ApplicationController
  include HomeHelper
  include CategoriesHelper
  include ArticlesHelper

  before_action :current_user, only: %i[index articles]

  def index
    @categories = Category.all.priority
    all_upvotes = Article.all.pluck(:cached_votes_up).max
    @most_voted_art = Article.all.where(cached_votes_up: all_upvotes).limit(1)
    @current_user
    @article_most_recent = Article.all.ordered_by_most_recent
  end

  def articles
    @articles = Article.all
  end

  def start; end
end
