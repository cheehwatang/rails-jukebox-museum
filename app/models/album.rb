class Album < ApplicationRecord
  belongs_to :artist
  has_many :tracks, destroy: :dependent

  validates :title, presence: true
end
