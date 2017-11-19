module Spotify
  class Connect
    def call(current_user, auth_object = {})
      current_user.update!(
        spotify_auth_object: auth_object.to_hash
      )
    end
  end
end