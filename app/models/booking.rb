class Booking < ApplicationRecord
  DESTINATION = %w[Mars Moon Mercury The\ Sun]
  CAPACITY = %w[2 4 6 8]
  belongs_to :spaceship
  belongs_to :user
  validates :price, :location, :arrive, :depart, :passenger_quantity, presence: true
  validates :destination, presence: true, inclusion: { in: DESTINATION }
end
