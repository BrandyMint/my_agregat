class Users::RegistrationsController < Devise::RegistrationsController

  # POST /resource
  def create
    build_resource(sign_up_params)

    if resource.save
      set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
      expire_session_data_after_sign_in!
      respond_with resource, :location => after_inactive_sign_up_path_for(resource)
    else
      clean_up_passwords resource
      respond_with resource
    end
  end

  def after_inactive_sign_up_path_for resource
    new_user_session_path
  end

end
