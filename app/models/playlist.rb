class Playlist < ApplicationRecord
  belongs_to :import

  validates :name, presence: true

  delegate :user, to: :import
end