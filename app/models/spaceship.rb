class Spaceship < ApplicationRecord
  belongs_to :user
  has_one_attached :image_url
  has_many :bookings, dependant: :destroy
  validates :name, :description, presence: true, uniqueness: true
  validates :capacity, presence: true
end
