class Movie < ApplicationRecord
  scope :most_recent, -> { order(premiere_world: :desc) }
end
