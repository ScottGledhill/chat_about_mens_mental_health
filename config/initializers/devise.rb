# Use this hook to configure devise mailer, warden hooks and so forth.
# Many of these configuration options can be set straight in your model.
Devise.setup do |config|
  config.reset_password_keys = [ :username ]
  config.confirmation_keys = [ :username ]
  config.mailer_sender = 'please-change-me-at-config-initializers-devise@example.com'
  config.authentication_keys = [ :login ]
  require 'devise/orm/active_record'
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 11
  config.reconfirmable = true
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 6..128
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/
  config.reset_password_within = 6.hours
  config.sign_out_via = :delete

end
