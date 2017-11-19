require 'rspotify/oauth'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, ENV.fetch("SPOTIFY_API_KEY"), ENV.fetch("SPOTIFY_API_SECRET"), scope: ENV.fetch("SPOTIFY_SCOPES")

  provider :lastfm, ENV.fetch("LAST_FM_API_KEY"), ENV.fetch("LAST_FM_API_SECRET")
end
