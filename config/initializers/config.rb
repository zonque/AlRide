Config.setup do |config|
  # Name of the constant exposing loaded settings
  config.const_name = 'Settings'

  if ENV.keys.include? 'Settings.platform_name'
    config.use_env = true
  end
end
