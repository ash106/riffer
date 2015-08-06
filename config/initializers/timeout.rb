Rack::Timeout.timeout = 120  # seconds

Rack::Timeout.unregister_state_change_observer(:logger) if Rails.env.development?
