Rails.application.configure do
  config.cache_classes = false

  config.eager_load = false

  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  config.action_mailer.raise_delivery_errors = true


  config.action_mailer.perform_deliveries = true

  config.action_mailer.smtp_settings = {
      :address => ENV['SMTP_ADDRESS'],
      :port => 587,
      :user_name => ENV['SMTP_USER_NAME'], #Your SMTP user
      :password => ENV['SMTP_PASSWORD'], #Your SMTP password
      :authentication => :login,
      :enable_starttls_auto => true
  }

  config.action_mailer.default_url_options = { host: "localhost:3000" }

  config.active_support.deprecation = :log

  config.active_record.migration_error = :page_load

  config.assets.debug = true

  config.assets.digest = true

  config.assets.raise_runtime_errors = true

end
