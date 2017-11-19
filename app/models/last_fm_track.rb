class LastFmTrack
  attr_reader :title, :artist

  def initialize(title:, artist:)
    @title = title
    @artist = artist
  end

  def self.from_json(payload)
    new(
      title: payload[:name],
      artist: payload[:artist][:content]
    )
  end
end