Recaptcha.configure do |config|
  config.skip_verify_env = ["development", "test"]
end