class HomeController < ApplicationController
  include HomeHelper
  require_relative 'articles_controller'
  def index
    @articles = Article.all
    @categories = Category.all
  end
end
