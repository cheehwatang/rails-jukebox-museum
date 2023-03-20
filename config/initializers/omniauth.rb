require 'rspotify/oauth'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, ENV['SPOTIFY_CLIENT_ID'], ENV['SPOTIFY_CLIENT_SECRET'],
    scope: %w(
      user-read-email
      user-read-private
      user-library-read
      user-library-modify
      playlist-read-private
      playlist-modify-public
    ).join(' ')
end

OmniAuth.config.allowed_request_methods = [:post, :get]