# -*- coding: utf-8 -*-
# configures your navigation

SimpleNavigation::Configuration.run do |navigation|
  navigation.items do |primary|
    if signed_in?
      primary.item :new_machine, I18n.t('menu.new_machine'), new_user_machine_path(current_user)
      primary.item :my_machines, I18n.t('menu.my_machines'), user_machines_path(current_user)
      primary.item :sing_out, I18n.t('sign_out'), destroy_user_session_path
    else
      primary.item :sing_in, I18n.t('sign_in'), new_user_session_path
      primary.item :registration, I18n.t('sign_up'), new_user_registration_path
    end
    #

    primary.dom_class = 'nav navbar-nav pull-right'

    # you can turn off auto highlighting for a specific level
    primary.auto_highlight = true
  end
end
