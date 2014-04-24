# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Load the app's custom environment variables here, before environments/*.rb
app_env_vars = File.join(Rails.root, 'config', 'initializers', 'app_env_vars.rb')
load(app_env_vars) if File.exists?(app_env_vars)

# Initialize the Rails application.
Horschgallery2::Application.initialize!

Horschgallery2::Application.configure do
  # Send email
  config.action_mailer.perform_deliveries = true
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.default_url_options = { host: 'domain.com'}

  config.action_mailer.smtp_settings = {
      address:              'smtp.gmail.com',
      port:                 587,
      domain:               'domain.of.sender.net',
      user_name:            ENV["OUTGOING_EMAIL"],
      password:             ENV["EMAIL_PASSWORD"],
      authentication:       'plain',
      enable_starttls_auto: true
    }

end
