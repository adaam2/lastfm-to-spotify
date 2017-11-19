module Tracks
  class Upserter
    include Registry::AutoInject[
      artist_upsert: "artist.upserter"
    ]

    def call(track_name, artist_name)
      existing_track(track_name, artist_name)
    rescue ActiveRecord::RecordNotFound => e
      Track
        .create!(
          title: track_name,
          artist: artist_upsert.call(
            artist_name
          )
        )
    end

    private

    def existing_track(name, artist)
      Track
        .includes(:artist)
        .find_by!(
          title: name,
          artists: {
            name: artist
          }
        )
    end
  end
end