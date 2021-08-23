class Spaceship < ApplicationRecord
  belongs_to :user
  validates :name, :description, :image_url, presence: true, uniqueness: true
  validates :capacity, presence: true
end
