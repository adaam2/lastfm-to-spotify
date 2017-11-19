class Import < ApplicationRecord
  belongs_to :user
  has_many :imports_tracks, dependent: :delete_all
  has_many :tracks, through: :imports_tracks
  has_many :playlists, dependent: :delete_all

  validates :name, presence: true
end