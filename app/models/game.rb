class Game < ApplicationRecord
  validates :name, :genre, :price, :release_date, presence: true
  validates :genre, inclusion: ['Simulator', 'Adventure', 'Strategy', 'Role-playing (RPG)', 'Shooter', 'Fighting', 'Sport']
  validates :price, numericality: {greater_than_or_equal_to: 1}
end
