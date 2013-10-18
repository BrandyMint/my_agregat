class CategoriesController < ApplicationController
  def show
    category = Category.find(params[:id])
    redirect_to category_machines_path(category)
  end
end