class RemoveDestinationFromBookings < ActiveRecord::Migration[6.0]
  def change
    remove_column :bookings, :destination, :string
  end
end
