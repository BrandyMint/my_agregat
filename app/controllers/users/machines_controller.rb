class Users::MachinesController < ApplicationController
  before_action :set_user

  def index
    authorize_action_for(Machine, @user)
    @machines = @user.machines.active.page params[:page]
  end

  def archive
    authorize_action_for(Machine, @user)
    @machines = @user.machines.archive.page params[:page]
    render :index
  end

  def new
    @machine = @user.machines.new
    authorize_action_for(@machine)
  end

  def create
    @machine = @user.machines.new(machine_params)
    authorize_action_for(@machine)
    if @machine.save
      redirect_to user_machine_path(@user, @machine)
    else
      render :new
    end
  end

  def edit
    @machine = @user.machines.find(params[:id])
    authorize_action_for(@machine)
  end

  def update
    @machine = @user.machines.find(params[:id])
    authorize_action_for(@machine)
    if @machine.update(machine_params)
      redirect_to user_machine_path(@user, @machine)
    else
      render :edit
    end
  end

  def show
    @machine = @user.machines.find(params[:id])
  end

  def activate
    machine = @user.machines.find(params[:id])
    machine.activate
    redirect_to :back
  end

  def archivate
    machine = @user.machines.find(params[:id])
    machine.archivate
    redirect_to :back
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def machine_params
    params.require(:machine).permit(:category_id, :name, :location, :charge, :driver_charge, :description)
  end
end