class Destination < ApplicationRecord
  has_one_attached :image_url
  validates :name, presence: true
  validates :flight_time, presence: true
end
