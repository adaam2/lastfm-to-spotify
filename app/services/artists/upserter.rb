module Artists
  class Upserter
    def call(artist_name)
      Artist.find_or_create_by!(
        name: artist_name
      )
    end
  end
end