require File.expand_path('../boot', __FILE__)

require 'rails/all'

if defined?(Bundler)
  Bundler.require(*Rails.groups(:assets => %w(development test)))
end

module Weltverbessern
  class Application < Rails::Application
    config.time_zone = Settings.time_zone || 'UTC'
    config.encoding = 'utf-8'
    config.filter_parameters += [:password]
    # Enable the asset pipeline
    config.assets.enabled = true
    # Version of your assets, change this if you want to expire all your assets
    config.assets.version = '1.0'

    ActiveRecord.legacy_connection_handling = false

    config.i18n.available_locales = Settings.available_locales || [:en, :de]
  end
end
