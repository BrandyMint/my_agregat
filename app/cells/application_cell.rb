class ApplicationCell < Cell::Rails
  include Devise::Controllers::Helpers
  helper_method :current_user
end
