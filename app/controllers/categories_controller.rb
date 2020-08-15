# frozen_string_literal: true

class CategoriesController < ApplicationController
  include CategoriesHelper
  include ArticlesHelper
  before_action :set_category, only: %i[show edit update destroy vote]
  before_action :current_user, only: [:show]
  def index
    @categories = Category.all.priority
  end

  def show; end

  def edit; end

  def update
    @category.update(category_params)
    redirect_to categories_path
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to home_index_path
    else
      render 'new'
    end
  end

  def destroy
    Category.find(params[:id]).destroy
    redirect_to articles_path
  end
end
