class Booking < ApplicationRecord
  DESTINATION = %w[Mars Moon]
  belongs_to :spaceship
  belongs_to :user
  belongs_to :destination
  validates :price, :arrive, :depart, :passenger_quantity, presence: true
  # validates :destination, presence: true, inclusion: { in: DESTINATION }
end
