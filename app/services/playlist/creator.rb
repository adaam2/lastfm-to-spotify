module Playlist
  class Creator
    def call(import)
      # Create the spotify playlist


      import.playlists.create!(

      )
    end

    private

    def spotify_user(import)
      RSpotify::User.new(import.user.spotify_auth_object)
    end
  end
end