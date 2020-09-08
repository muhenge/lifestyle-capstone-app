module HomeHelper
  def article_params
    params.require(:article).permit(:title, :text, :image)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
