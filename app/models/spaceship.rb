class Spaceship < ApplicationRecord
  belongs_to :user
  has_one_attached :image_url
  has_many :bookings, dependent: :destroy
  validates :name, :description, presence: true
  validates :capacity, presence: true
end
