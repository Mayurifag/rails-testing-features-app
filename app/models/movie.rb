class Movie < ApplicationRecord
  scope :most_recent, -> { order(premiere_world: :desc) }
  validates :title, presence: true
end
