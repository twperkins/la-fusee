class Destination < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_one_attached :image_url
  validates :name, presence: true
  validates :flight_time, presence: true
end
