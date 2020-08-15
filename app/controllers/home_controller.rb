# frozen_string_literal: true

class HomeController < ApplicationController
  include HomeHelper
  include CategoriesHelper
  include ArticlesHelper
  require 'articles_controller'
  require 'categories_controller'
  before_action :current_user, only: %i[index articles]

  def index
    @categories = Category.all.priority
    all_up_votes = Article.select { |art| art.cached_votes_up }
    max_vote = all_up_votes.map { |i| i.cached_votes_up }.max
    @most_voted_art = Article.select { |article| article.get_upvotes.size == max_vote }
    @current_user
  end

  def articles
    @articles = Article.all
  end

  def start; end
end
