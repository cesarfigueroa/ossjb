require File.expand_path('../boot', __FILE__)

require 'rails'
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_view/railtie'

Bundler.require(*Rails.groups)

module Ossjb
  class Application < Rails::Application
    config.active_record.raise_in_transactional_callbacks = true

    config.generators do |g|
      g.assets false
      g.helpers false
      g.test_framework :test_unit, :fixture => false
      g.view_specs false
      g.helper_specs false
    end
  end
end
