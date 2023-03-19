class Jukebox < ApplicationRecord
  belongs_to :user
  has_many :records, dependent: :destroy
  has_many :tracks, through: :records

  validates :name, presence: true, uniqueness: true
end
