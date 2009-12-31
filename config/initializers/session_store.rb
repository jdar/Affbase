# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_AffBase_session',
  :secret      => 'e4681eb4db6b49e4eb83e9a5ced6be0c63b35cdaf819b3cff4f20f49bd311a95d338168dd4e4ad35297c13362dfac2e4f1f1592447f7f43561400f2dc7356e44'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
