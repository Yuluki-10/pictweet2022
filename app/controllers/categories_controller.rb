class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def create
    @category = Category.find_or_create_by(category_params)
    redirect_to action: :index
  end

  private

  def category_params
    params.permit(:category_name)
  end
end