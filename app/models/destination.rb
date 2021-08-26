class Destination < ApplicationRecord
  validates :name, presence: true
  validates :flight_time, presence: true
  validates :image_url, presence: true
end
