class HomeController < ApplicationController
  def index
    @categories = Category.all
    all_upvotes = Article.all.pluck(:cached_votes_up).max
    @most_voted_art = Article.all.where(cached_votes_up: all_upvotes).limit(2)
    @article_most_recent = Article.all.ordered_by_most_recent
  end

  def private
  end
end
