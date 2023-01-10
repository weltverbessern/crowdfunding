require 'active_merchant'

def env_or_fail(name)
  name += '_TEST' if Settings.payment_mode == 'test'
  raise "Environment variable '#{name}' missing." unless ENV.has_key?(name)
  ENV[name]
end

if Settings.payment_mode == 'test'
  ActiveMerchant::Billing::Base.mode = :test
elsif Settings.payment_mode == 'production'
  ActiveMerchant::Billing::Base.mode = :production
else
  raise 'Payment mode (test or production) is not configured.'
end

if Settings.payment_provider_stripe
  GATEWAY_STRIPE = ActiveMerchant::Billing::StripePaymentIntentsGateway.new(
    :login => env_or_fail('WELTVERBESSERN_STRIPE_SECRET_KEY')
  )
  PUBLIC_KEY_STRIPE = env_or_fail('WELTVERBESSERN_STRIPE_PUBLIC_KEY')
end
