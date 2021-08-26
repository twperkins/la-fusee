class AddApprovedToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :approved, :boolean
  end
end
