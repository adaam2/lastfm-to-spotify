class User < ApplicationRecord
  has_many :imports
  has_many :imports_tracks
  has_many :tracks, through: :imports_tracks

  before_validation :generate_token

  before_save :set_ready_for_import

  scope :with_imports, -> {
    joins(:imports).uniq
  }

  validates :token, presence: true

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

  def generate_token
    self.token = loop do
      random_token = SecureRandom.urlsafe_base64(nil, false)
      break random_token unless User.exists?(token: random_token)
    end
  end

  def set_ready_for_import
    if has_spotify_auth? && has_lastfm_auth?
      ready_for_import = true
    end
  end
end