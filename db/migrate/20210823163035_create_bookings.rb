class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.float :price
      t.string :destination
      t.string :location
      t.string :arrive
      t.string :depart
      t.integer :passenger_quantity
      t.references :spaceship, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
