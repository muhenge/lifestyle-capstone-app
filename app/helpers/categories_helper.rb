# frozen_string_literal: true

module CategoriesHelper
  def category_params
    params.require(:category).permit(:name, :priority, :image)
  end

  def set_category
    @category = Category.find(params[:id])
  end
end
