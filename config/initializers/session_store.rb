# Be sure to restart your server when you modify this file.

Rails.application.config.session_store :cookie_store, key: '_DeviseDemo_session'


# secure_option = (Rails.env.development? || Rails.env.test?) ? false : true
# DeviseDemo::Application.config.session_store :cookie_store, { key: '_xxxx_session', secure: secure_option }