class CategoriesCell < ApplicationCell
  def display
    categories = Category.all
    render :locals => {categories: categories}
  end
end
