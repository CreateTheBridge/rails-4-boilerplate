Rails.application.config.session_store :redis_store, "#{ENV['REDIS_URI']}/0/session"
