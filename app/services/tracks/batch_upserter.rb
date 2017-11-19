module Tracks
  class BatchUpserter
    include Registry::AutoInject[
      "track.upserter"
    ]

    def call(import, tracks = [])
      return unless tracks

      upserted_tracks = tracks.map do |track|
        artist, title = artist_title(track)

        Rails.logger.info "UPSERT: #{artist} - #{title}"
        upserter.call(title, artist)
      end

      import.tracks << upserted_tracks
      import.save
    end

    private

    def artist_title(track)
      [track[:artist][:content], track[:name]]
    end
  end
end