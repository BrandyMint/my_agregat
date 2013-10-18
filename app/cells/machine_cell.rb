class MachineCell < Cell::Rails
  def display machine
    render :locals => {machine: machine}
  end
end
