# frozen_string_literal: true

module ArticlesHelper
  def article_params
    params.require(:article).permit(:title, :text, :image, :category_id, :authorid)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
