# Use this hook to configure devise mailer, warden hooks and so forth.
# Many of these configuration options can be set straight in your model.
Devise.setup do |config|

  config.omniauth :facebook, '363765213737145', '32b6e6962c7e8064055b8ce74b6907f6'
  config.omniauth :vkontakte, '3646411', 'aQyLc8UpB9vSya6dHZhW'

  config.mailer_sender = "please-change-me-at-config-initializers-devise@example.com"

  config.apply_schema = false

  require 'devise/orm/active_record'

  config.case_insensitive_keys = [ :email ]

  config.strip_whitespace_keys = [ :email ]

  config.skip_session_storage = [:http_auth]

  config.stretches = Rails.env.test? ? 1 : 10

  config.reconfirmable = true

  config.use_salt_as_remember_token = true

  config.reset_password_within = 6.hours

  config.sign_out_via = :delete
end
