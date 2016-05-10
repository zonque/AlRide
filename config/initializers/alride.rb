require 'dotenv'
Dotenv.load

ActionMailer::Base.default_url_options = {
  host: ENV['ALRIDE_HOST'],
  port: ENV['ALRIDE_PORT'],
  protocol: ENV['ALRIDE_PROTOCOL'],
}

if ENV['MANDRILL_USERNAME']
  # For heroku deployment, we use Mandrill as mail server.
  ActionMailer::Base.smtp_settings = {
    port:            '587',
    address:         'smtp.mandrillapp.com',
    user_name:       ENV['MANDRILL_USERNAME'],
    password:        ENV['MANDRILL_APIKEY'],
    domain:          'heroku.com',
    authentication:  :plain
  }
  ActionMailer::Base.delivery_method = :smtp
else
  ActionMailer::Base.smtp_settings = {
    address: ENV['ALRIDE_SMTP_SERVER'],
    domain:  ENV['ALRIDE_SMTP_DOMAIN'],
  }
end

AlRide::Application.config.secret_token = ENV['ALRIDE_SECRET']
