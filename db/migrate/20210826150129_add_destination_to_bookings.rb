class AddDestinationToBookings < ActiveRecord::Migration[6.0]
  def change
    add_reference :bookings, :destination, null: false, foreign_key: true
  end
end
