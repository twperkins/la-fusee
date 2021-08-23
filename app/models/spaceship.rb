class Spaceship < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :name, :description, :image_url, presence: true, uniqueness: true
  validates :capacity, presence: true
end
