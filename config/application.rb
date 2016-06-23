require File.expand_path('../boot', __FILE__)

require "action_controller/railtie"
require "rails/test_unit/railtie"
require "action_mailer/railtie"
require "active_model"

require 'neo4j/railtie'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module LordOfTheTweets
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :en

    config.autoload_paths += ["#{config.root}/lib"]

    ### NEO4J CONNECTION
    begin
        _NEO4JCONF = YAML.load("#{config.root}/config/neo4j.yml")[Rails.env] 
    rescue
        Rails.logger.fatal "NEO4J configuration file not found"
    end

    config.neo4j.session_options = {
        basic_auth: {
            username: _NEO4JCONF["username"],
            password: _NEO4JCONF["password"]
        }
    }
    config.neo4j.session_type = _NEO4JCONF["session_type"]
    config.neo4j.session_path = _NEO4JCONF["session_path"] || _NEO4JCONF["host"]
    ### END: NEO4J CONNECTION
  end
end
