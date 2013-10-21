class Users::MachinesController < ApplicationController
  authorize_actions_for Machine, :except => [:index, :archive]
  def index
    @user = User.find(params[:user_id])
    authorize_action_for(Machine, @user)
    @machines = @user.machines.active.page params[:page]
  end

  def archive
    @user = User.find(params[:user_id])
    authorize_action_for(Machine, @user)
    @machines = @user.machines.archive.page params[:page]
    render :index
  end

  def activate
    user = User.find(params[:user_id])
    machine = user.machines.find(params[:id])
    machine.activate
    redirect_to :back
  end

  def archivate
    user = User.find(params[:user_id])
    @machine = user.machines.find(params[:id])
    @machine.archivate
    redirect_to :back
  end


end