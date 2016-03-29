require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ImagineCms
  class Application < Rails::Application
    config.i18n.default_locale = :cs
    config.time_zone = 'Prague'

    ActiveSupport.halt_callback_chains_on_return_false = false

    Paperclip.options[:command_path] = "/usr/bin/"

    config.assets.initialize_on_precompile = false
    # config.to_prepare do
    #   Devise::SessionsController.layout 'administration'
    #   Devise::RegistrationsController.layout 'administration'
    #   Devise::ConfirmationsController.layout 'administration'
    #   Devise::UnlocksController.layout 'administration'
    #   Devise::PasswordsController.layout 'administration'
    # end
  end
end
