class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    redirect_to user_machines_path(user)
  end
end