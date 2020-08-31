class CategoriesController < ApplicationController
  include CategoriesHelper
  include ArticlesHelper
  before_action :set_category, only: %i[show edit update destroy vote]
  before_action :current_user, only: [:show]

  def show
    @cat_articles = @category.articles.ordered_by_most_recent
  end
end
