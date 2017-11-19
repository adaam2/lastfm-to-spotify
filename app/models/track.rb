class Track < ApplicationRecord
  belongs_to :artist
  has_many :playlists, through: :imports
  has_many :imports_tracks
  has_many :imports, through: :imports_tracks

  validates :title, presence: true

  scope :newest, -> {
    order(created_at: :asc)
  }

  scope :ordered, -> {
    joins(:artist).order("artists.name asc, tracks.title asc")
  }
end