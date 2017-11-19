module Tracks
  class BatchUpserter
    include Registry::AutoInject[
      "track.upserter",
      "import.deduper"
    ]

    def call(import, tracks = [])
      return unless tracks

      upserted_tracks = tracks.map do |track|
        upserter.call(track.title, track.artist)
      end

      deduped = deduper.call(import, upserted_tracks)

      import.tracks << deduped
      import.save
    end
  end
end