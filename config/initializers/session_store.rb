Rails.application.config.session_store :cookie_store, key: '_nexops_session',
  secure: Rails.env.production?,
  httponly: true,
  same_site: Rails.env.production?,
  expire_after: 14.days,
  encrypt: true,
  salt: Rails.application.secret_key_base
