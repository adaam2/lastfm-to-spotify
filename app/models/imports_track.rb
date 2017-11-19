class ImportsTrack < ApplicationRecord
  belongs_to :import
  belongs_to :track
end