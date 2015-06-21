require 'dotenv'
Dotenv.load

ActionMailer::Base.default_url_options = {
  host: ENV['ALRIDE_HOST'],
  port: ENV['ALRIDE_PORT'],
  protocol: ENV['ALRIDE_PROTOCOL'],
}

ActionMailer::Base.smtp_settings = {
  address: ENV['ALRIDE_SMTP_SERVER'],
}

AlRide::Application.config.secret_token = ENV['ALRIDE_SECRET']

