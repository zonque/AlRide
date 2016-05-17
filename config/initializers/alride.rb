ActionMailer::Base.default_url_options = Settings.mail.default_url_options.to_hash

if Settings.mandrill
  # For heroku deployment, we use Mandrill as mail server.
  ActionMailer::Base.smtp_settings = {
    port:            ENV['MAILGUN_SMTP_PORT'],
    address:         ENV['MAILGUN_SMTP_SERVER'],
    user_name:       ENV['MAILGUN_SMTP_LOGIN'],
    password:        ENV['MAILGUN_SMTP_PASSWORD'],
    domain:          'heroku.com',
    authentication:  :plain
  }
  ActionMailer::Base.delivery_method = :smtp
else
  ActionMailer::Base.delivery_method = Settings.mail.delivery_method.to_sym
  ActionMailer::Base.smtp_settings = Settings.mail.smtp_settings.to_hash
end
