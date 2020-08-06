class HomeController < ApplicationController
  include HomeHelper
  include CategoriesHelper
  include ArticlesHelper
  require 'articles_controller'
  require 'categories_controller'
  before_action :current_user, only: %i[index articles]

  def index
    @categories = Category.all
    @most_voted_art = Article.select {|article| article.get_upvotes.size == 3}
    @current_user
  end

  def articles
    @articles = Article.all
  end

  def start; end
end
