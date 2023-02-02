# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
    :user_name => 'apikey', # This is the string literal 'apikey', NOT the ID of your API key
    :password => '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', # This is the secret sendgrid API key which was issued during API key creation
    :domain => 'localhost',
    :address => 'smtp.sendgrid.net',
    :port => 587,
    :authentication => :plain,
    :enable_starttls_auto => true
  }
