# Be sure to restart your server when you modify this file.

Modern::Application.config.session_store :cookie_store, key: '_modern_session'

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rails generate session_migration")
# Modern::Application.config.session_store :active_record_store
