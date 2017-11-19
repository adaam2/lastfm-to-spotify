class User < ApplicationRecord
  has_many :imports
  has_many :imports_tracks
  has_many :tracks, through: :imports_tracks

  before_save :set_ready_for_import

  scope :with_imports, -> {
    joins(:imports).uniq
  }

  def authenticated_externally?
    ready_for_import?
  end

  def has_spotify_auth?
    spotify_auth_object.present?
  end

  def has_lastfm_auth?
    lastfm_auth_object.present?
  end

  private

  def set_ready_for_import
    if has_spotify_auth? && has_lastfm_auth?
      ready_for_import = true
    end
  end
end