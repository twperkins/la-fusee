class Destination < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_one_attached :image_url
  validates :name, presence: true
  validates :flight_time, presence: true


    include PgSearch::Model
  pg_search_scope :search_by_name,
    against: [ :name ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
