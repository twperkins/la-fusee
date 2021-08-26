class Destination < ApplicationRecord
  has_many :bookings, dependent: :destroy
  validates :name, presence: true
  validates :flight_time, presence: true
  validates :image_url, presence: true
end
