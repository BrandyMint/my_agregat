class CategoriesCell < Cell::Rails
  def display
    categories = Category.all
    render :locals => {categories: categories}
  end
end
