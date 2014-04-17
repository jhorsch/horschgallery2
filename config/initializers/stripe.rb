Rails.configuration.stripe = {
  :publishable_key => ENV['pk_test_Ph1E05YKx7NWhwtIEYTkbQ7z'],
  :secret_key      => ENV['sk_test_epYHN93uqwj2aFBWXWoXK9bY']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
