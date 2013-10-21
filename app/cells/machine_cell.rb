class MachineCell < ApplicationCell
  def display_common machine
    render :locals => {machine: machine}
  end

  def display_own machine
    render :locals => {machine: machine}
  end
end
