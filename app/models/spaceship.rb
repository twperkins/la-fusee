class Spaceship < ApplicationRecord
  belongs_to :user
  has_one_attached :image_url
  has_many :bookings
  validates :name, :description, presence: true, uniqueness: true
  validates :capacity, presence: true
end
