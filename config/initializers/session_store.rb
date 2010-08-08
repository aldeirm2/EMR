# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_EMR_session',
  :secret      => '9f9df03ac00290dde5be6a0623f44d7fcfc66d5768727ce3d809d2172d216a0b4b8e7084991cb9e8a73b5da18730122fa530f81c924547a640b90a03ec9daf6e'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
