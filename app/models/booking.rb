class Booking < ApplicationRecord
  belongs_to :spaceship
  belongs_to :user
  validates :price, :location, :arrive, :depart, :passenger_quantity, presence: true
  validates :destination, presence: true, inclusion: { in: %w[mars moon mercury] }
end
