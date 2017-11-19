module Spotify
  class Client
    def create_playlist(spotify_user, playlist_name)
      spotify_user.create_playlist!(playlist_name)
    end

    def add_to_playlist(playlist, track_ids)
      playlist.add_tracks!(track_ids)
    end

    def find_user(auth_object)
      RSpotify::User.new(auth_object)
    end
  end
end