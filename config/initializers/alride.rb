ActionMailer::Base.default_url_options = { host: Settings.host, protocol: Settings.protocol }

if Settings['smtp_settings']
  smtp_settings = Hash.new
  Settings.smtp_settings.each {|k, v| smtp_settings[k.to_sym] = v }
  ActionMailer::Base.smtp_settings = smtp_settings
elsif ENV['MANDRILL_USERNAME']
  ActionMailer::Base.smtp_settings = {
    :port =>           '587',
    :address =>        'smtp.mandrillapp.com',
    :user_name =>      ENV['MANDRILL_USERNAME'],
    :password =>       ENV['MANDRILL_APIKEY'],
    :domain =>         'heroku.com',
    :authentication => :plain
  }
  ActionMailer::Base.delivery_method = :smtp
end
