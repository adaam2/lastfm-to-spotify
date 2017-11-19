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

    end

    namespace(:track) do
      register(:upserter, -> { Track::Upserter.new })
      register(:batch_upserter, -> { Track::BatchUpserter.new })
    end

    namespace(:playlist) do
      register(:creator, -> { Playlist::Creator.new })
    end

    namespace(:import) do
      register(:creator, -> { Import::Creator.new })
    end

    namespace(:lastfm) do
      register(:client, -> { LastFm::Client.new })
    end

    namespace(:spotify) do
      register(:client, -> { Spotify::Client.new })
    end
  end
end
