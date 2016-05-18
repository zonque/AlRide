module LocaleHelpers

  def for_each_locale
    I18n.available_locales.each do |locale|
      I18n.default_locale = locale
      yield
    end
  end

end

RSpec.configure do |config|
  config.include LocaleHelpers,   type: :controller
  config.include LocaleHelpers,   type: :feature
  config.include LocaleHelpers,   type: :mailer
end
