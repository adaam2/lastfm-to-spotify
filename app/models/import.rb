class Import < ApplicationRecord
  belongs_to :user
  has_many :imports_tracks, dependent: :destroy
  has_many :tracks, through: :imports_tracks
  has_many :playlists, dependent: :destroy

  validates :name, presence: true
end