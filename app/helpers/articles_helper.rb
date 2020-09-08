module ArticlesHelper
  def article_params
    params.require(:article).permit(:title, :text, :image, :category_id, :authorid)
  end

  def title_error(article)
    flash[:notice] = "Title can't be empty" if article.errors[:title][0] == "can't be blank"
  end

  def text_error(article)
    flash[:notice] = "Text can't be empty" if article.errors[:text][0] == "can't be blank"
  end

  def cat_error(article)
    flash[:notice] = 'Please select' if article.errors.messages[:category][0] == 'must exist'
  end

  private

  def set_article
    @article = Article.find(params[:id]) or not_found
  end

  def not_found
    raise ActionController::RoutingError, 'Not Found'
  end
end
