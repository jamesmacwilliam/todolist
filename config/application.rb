require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Tcob
  class Application < Rails::Application

    config.assets.precompile.shift

    # Register asset extensions for angular
    #
    config.assets.precompile.push(Proc.new do |path|
      File.extname(path).in? %w[
      .html .erb .haml .png .gif .jpg .jpeg .svg
      ]
    end)

    config.angular_html2js.module_name = 'todo.main'

    # For Foundation 5
    config.assets.precompile += %w[ vendor/modernizr favicon.ico ]

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
  end
end
