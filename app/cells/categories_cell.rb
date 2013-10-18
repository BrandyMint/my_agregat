class CategoriesCell < Cell::Rails

  def display
    @categories = Category.all
    render
  end

end
