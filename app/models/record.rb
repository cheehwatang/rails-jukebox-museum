class Record < ApplicationRecord
  belongs_to :jukebox
  belongs_to :track
end
