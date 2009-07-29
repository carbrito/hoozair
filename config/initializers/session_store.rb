# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_hoozair_session',
  :secret      => '8a707a576ee98131aa21e1a796a0488b98f0b0aeedc317568b82d0422157913e50c2f49042c69e6ce6fc236842dfb3bf48fe0aad5734c1318dcfad55d55f501c'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
