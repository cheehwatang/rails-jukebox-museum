class Track < ApplicationRecord
  belongs_to :genre
  belongs_to :album
  has_many :records


  validates :title, presence: true
end
