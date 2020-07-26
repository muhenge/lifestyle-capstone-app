module CategoriesHelper
  def category_params
    params.require(:category).permit(:name, :priority)
  end
  def set_category
    @category = Category.find(params[:id])
  end
end
