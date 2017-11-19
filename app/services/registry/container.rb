module Registry
  class Container
    extend Dry::Container::Mixin

    namespace(:connect) do
      register(:spotify, -> { Spotify::Connect.new })
      register(:lastfm, -> { LastFm::Connect.new })
    end

    register(:importer, -> { Facades::Importer.new })
    register(:exporter, -> { Facades::Exporter.new })

    # Subsidiary services
    namespace(:artist) do
      register(:upserter, -> { Artists::Upserter.new })
    end

    namespace(:track) do
      register(:upserter, -> { Tracks::Upserter.new })
      register(:batch_upserter, -> { Tracks::BatchUpserter.new })
    end

    namespace(:playlist) do
      register(:creator, -> { Playlists::Creator.new })
    end

    namespace(:import) do
      register(:creator, -> { Imports::Creator.new })
      register(:eraser, -> { Imports::Eraser.new })
      register(:deduper, -> { Imports::Deduper.new })
    end

    namespace(:lastfm) do
      register(:client, -> { LastFm::Client.new })
    end

    namespace(:spotify) do
      register(:client, -> { Spotify::Client.new })
    end
  end
end
