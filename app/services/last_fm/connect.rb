module LastFm
  class Connect
    def call(current_user, auth_object = {})
      current_user.update!(
        lastfm_auth_object: auth_object.to_hash,
        lastfm_registration_date: registration_date(auth_object),
        lastfm_profile_image_url: profile_image_url(auth_object)
      )
    end

    private

    def profile_image_url(auth_object)
      auth_object["extra"]["raw_info"]["image"].last["#text"]
    end

    def registration_date(auth_object)
      Time.at auth_object["extra"]["raw_info"]["registered"]["unixtime"].to_i
    end
  end
end