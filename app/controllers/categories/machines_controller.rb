class Categories::MachinesController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    @machines = @category.machines.active.page params[:page]
  end
end