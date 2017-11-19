module Imports
  class Deduper
    def call(import, tracks)
      tracks.reject do |track|
        import.tracks.include?(track)
      end
    end
  end
end