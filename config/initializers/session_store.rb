# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_lost_toys_session',
  :secret      => '124cb14d4cd5fc89fba18181c3492d92570e907a65b583b8681179c1d2413cbb6da33bff74b712f35955c4523b0eef5160e393c3c63b0f67fbbb27d6d1da448b'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
