# frozen_string_literal: true
require "Strategies/gett"
# Use this hook to configure devise mailer, warden hooks and so forth.
# Many of these configuration options can be set straight in your model.
Devise.setup do |config|
  config.mailer_sender = 'please-change-me-at-config-initializers-devise@example.com'

  require 'devise/orm/active_record'

  config.case_insensitive_keys = [:email]

  config.strip_whitespace_keys = [:email]

  config.skip_session_storage = [:http_auth]

  config.stretches = Rails.env.test? ? 1 : 11

  config.reconfirmable = true

  config.expire_all_remember_me_on_sign_out = true

  config.password_length = 6..128

  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/

  config.reset_password_within = 6.hours

  config.sign_out_via = :delete


  # ==> OmniAuth
  config.omniauth :gett, 'ifHIS5EX5t6Kln_e0a78Om75S1HM6tfQaMh-Opw4GWs', 'OXlW6Lv4UBJLdoXbpO03iIGt1hcvXeMdfXcvjsgLPCA', callback: 'http://localhost:3002/users/auth/gett/callback'
end
