# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_bucketread_session',
  :secret      => '209cb857844bb200b4177473dd422f1b2c8f18c0cf4d05422509284aada4f0ed7426e98495870668bc3b64c5e82d78ce0bc318e9463bd8f150ca2ce715a792e2'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
