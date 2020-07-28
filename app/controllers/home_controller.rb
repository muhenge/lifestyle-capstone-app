class HomeController < ApplicationController
  include HomeHelper
  include CategoriesHelper
  require 'articles_controller'
  require 'categories_controller'
  def index
    @articles = Article.all
    @categories = Category.all
  end
end
