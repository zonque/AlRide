require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module AlRide
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    config.i18n.available_locales = [:en, :de]
    config.i18n.default_locale = :en

    config.action_mailer.default_url_options = Settings.mail.default_url_options.to_hash rescue {}

    if ENV['MAILGUN_SMTP_SERVER']
      # For heroku deployment, we use Mandrill as mail server.
      config.action_mailer.smtp_settings = {
        port:            ENV['MAILGUN_SMTP_PORT'],
        address:         ENV['MAILGUN_SMTP_SERVER'],
        user_name:       ENV['MAILGUN_SMTP_LOGIN'],
        password:        ENV['MAILGUN_SMTP_PASSWORD'],
        domain:          'heroku.com',
        authentication:  :plain
      }
      config.action_mailer.delivery_method = :smtp
    else
      config.action_mailer.delivery_method = Settings.mail.delivery_method.to_sym rescue :smtp
      config.action_mailer.smtp_settings = Settings.mail.smtp_settings.to_hash rescue {}
    end

  end
end
