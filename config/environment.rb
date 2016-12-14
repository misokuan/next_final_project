# Load the Rails application.
require File.expand_path('../application', __FILE__)
require 'carrierwave/orm/activerecord'

Braintree::Configuration.environment = :sandbox
Braintree::Configuration.merchant_id = ENV["MERCHANT_ID"]
Braintree::Configuration.public_key = ENV["PUBLIC_KEY"]
Braintree::Configuration.private_key = ENV["PRIVATE_KEY"]

# Initialize the Rails application.
Rails.application.initialize!
