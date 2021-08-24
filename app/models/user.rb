class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :image_url
  has_many :bookings
  has_many :spaceships
  validates :name, :image_url, uniqueness: true, presence: true
end
