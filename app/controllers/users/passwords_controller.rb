class Users::PasswordsController < Devise::PasswordsController
  def resource_params
    res_par = super
    begin
      res_par[:phone] = Phony.normalize(res_par[:phone]) if res_par[:phone]
    rescue
    end
    res_par
  end
end