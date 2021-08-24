class Booking < ApplicationRecord
  DESTINATION = %w[mars moon mercury]
  belongs_to :spaceship
  belongs_to :user
  validates :price, :location, :arrive, :depart, :passenger_quantity, presence: true
  validates :destination, presence: true, inclusion: { in:DESTINATION }
end
