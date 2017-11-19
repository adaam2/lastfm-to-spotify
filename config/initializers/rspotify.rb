module RSpotify

  # @attr [String] birthdate       The user's date-of-birth. This field is only available when the current user has granted access to the *user-read-birthdate* scope.
  # @attr [String] country         The country of the user, as set in the user's account profile. An {http://en.wikipedia.org/wiki/ISO_3166-1_alpha-2 ISO 3166-1 alpha-2 country code}. This field is only available when the current user has granted access to the *user-read-private* scope.
  # @attr [Hash]   credentials     The credentials generated for the user with OAuth. Includes access token, token type, token expiration time and refresh token. This field is only available when the current user has granted access to any scope.
  # @attr [String] display_name    The name displayed on the user's profile. This field is only available when the current user has granted access to the *user-read-private* scope.
  # @attr [String] email           The user's email address. This field is only available when the current user has granted access to the *user-read-email* scope.
  # @attr [Hash]   followers       Information about the followers of the user
  # @attr [Array]  images          The user's profile image. This field is only available when the current user has granted access to the *user-read-private* scope.
  # @attr [String] product         The user's Spotify subscription level: "premium", "free", etc. This field is only available when the current user has granted access to the *user-read-private* scope.
  # @attr [Hash]   tracks_added_at A hash containing the date and time each track was saved by the user. Note: the hash is filled and updated only when {#saved_tracks} is used.
  class User < Base
    def initialize(options = {})
      credentials = options['credentials']
      options     = options['info'] if options['info']

      @birthdate    ||= options['birthdate']
      @country      ||= options['country']
      @display_name ||= options['display_name']
      @email        ||= options['email']
      @followers    ||= options['followers']
      @images       ||= options['images']
      @product      ||= options['product']

      super(options)
      if credentials
        @@users_credentials ||= {}
        @@users_credentials[@id] = credentials
        @credentials = @@users_credentials[@id]
      end
    end

    def create_playlist!(name, public: true)
      url = "users/#{@id}/playlists"
      request_data = { name: name, public: public }.to_json
      response = User.oauth_post(@id, url, request_data)
      return response if RSpotify.raw_response
      Playlist.new response
    end
  end
end
