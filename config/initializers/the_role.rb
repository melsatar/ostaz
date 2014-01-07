TheRole.configure do |config|
  config.layout                     = :application
  config.default_user_role          = :user
  config.access_denied_method       = :access_denied
  config.login_required_method      = :authenticate_user!
end
