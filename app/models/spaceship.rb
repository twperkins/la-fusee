class Spaceship < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :destinations, through: :bookings
  has_one_attached :image_url
  validates :name, :description, :cost, presence: true
  validates :capacity, presence: true
  validates :image_url, presence: true
end
